/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "adc.h"
#include "i2c.h"
#include "rtc.h"
#include "spi.h"
#include "tim.h"
#include "usart.h"
#include "usb_device.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stdio.h"
#include "SX1278.h"
#include "ssd1306.h"
#include <stdio.h>
#include <string.h>
#include <usbd_cdc_if.h>

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
_Bool flag_new_position = 0;
_Bool flag_BUTTON_cliked = 0;
_Bool flag_FIRE_cliked = 0;
int ret;
char buffer[64];
int adc_flag;
int adc_value;
enum state {INIT, SET_TIME, DEFAULT_SCREEN, SETTINGS, ARMING, DISARMING, COUNTING_DOWN, LAUNCH, NO_PACKETS};
SX1278_hw_t SX1278_hw;
SX1278_t SX1278;
ROCKET_DATA Actual_data;
volatile uint16_t pulse_count; // Licznik impulsow
volatile uint16_t positions; // Licznik przekreconych pozycji

RTC_TimeTypeDef RtcTime;
RTC_DateTypeDef RtcDate;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_NVIC_Init(void);
/* USER CODE BEGIN PFP */

//Funkcja obsługi przerwania dla odebania paczki danych z modułu LoRa
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin);
//Funcja obsługi przerwania ADC
void HAL_ADC_ConvCpltCallback( ADC_HandleTypeDef *hadc);
//Funkcja miga diodą blink_times -razy z czasem time
void LED_blink(int blink_times, int time);
//Funkcja wlaczajaca buzzer na time_delay milisekund
void Beep(int time_delay);
// Przeciazenie funkcji printf, aby wysylala dane po UART
int _write(int file, char *ptr, int len);



/*    Funckja przyjmuje jako parametry:     */
/* szer.geo., dlug.geo., wysokosc, predkosc */
/* korzysta z funkcji printf i wysyła dane  */
/*  w formacie SSSS/DDDD/WWWW/PPPP zwraca   */
/*  wartosc zwracana przez funkcje pritf.    */
int writeUART(float latitude, float longitude, float altitude, float velocity, int rssi, int snr);
int writeUART2(float latitude, float longitude, int name);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

//

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */


  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_SPI1_Init();
  MX_USART2_UART_Init();
  MX_I2C2_Init();
  MX_RTC_Init();
  MX_USB_DEVICE_Init();
  MX_TIM1_Init();

  /* Initialize interrupts */
  MX_NVIC_Init();
  /* USER CODE BEGIN 2 */
  //HAL_TIM_Base_Start_IT(&htim1);
  HAL_TIM_Encoder_Start(&htim1, TIM_CHANNEL_ALL);
  HAL_ADC_Start_IT(&hadc1);
  ssd1306_Init();
  //ssd1306_Print_initial_screen();
  //HAL_Delay(2000);

	//initialize LoRa module
	SX1278_hw.dio0.port = DO_RF_GPIO_Port;
	SX1278_hw.dio0.pin = DO_RF_Pin;
	SX1278_hw.nss.port = CS_RF_GPIO_Port;
	SX1278_hw.nss.pin = CS_RF_Pin;
	SX1278_hw.reset.port = RST_RF_GPIO_Port;
	SX1278_hw.reset.pin = RST_RF_Pin;
	SX1278_hw.spi = &hspi1;

	SX1278.hw = &SX1278_hw;

	SX1278_begin(&SX1278, 868E6, SX1278_POWER_20DBM, SX1278_LORA_SF_8, SX1278_LORA_BW_125KHZ, 10);
	ret = SX1278_LoRaEntryRx(&SX1278, 16, 2000);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	char str_lat[]="00000000", str_lon[]= "00000000", str_alt[]= "000000", str_vel[]= "0000";
	float V_Bat = 0.0;
	uint8_t current_state = INIT;
	int name = 0;

	while (1){

		switch (current_state)
		{
			case INIT:
				ssd1306_Print_initial_screen();
				if (HAL_GetTick() >= 2000) current_state = SET_TIME;
				break;

			case SET_TIME:
				ssd1306_Print_settime_screen();
				if(flag_BUTTON_cliked){
					flag_BUTTON_cliked = 0;
					current_state = DEFAULT_SCREEN;
				}
				break;

			case DEFAULT_SCREEN:
				ssd1306_Print_default_screen();
				if(flag_BUTTON_cliked){
					flag_BUTTON_cliked = 0;
					current_state = SETTINGS;
				}
				if(flag_FIRE_cliked && Actual_data.soft_arm){
					flag_FIRE_cliked = 0;
					current_state = COUNTING_DOWN;
				}
				break;

			case SETTINGS:
				ssd1306_Print_settings_screen();
				if(flag_BUTTON_cliked){
					flag_BUTTON_cliked = 0;
					int rand_variable = rand();
					if( (rand_variable % 3) == 0 ) current_state = ARMING;
					if( (rand_variable % 3) == 1 ) current_state = DISARMING;
					if( (rand_variable % 3) == 2 ) current_state = DEFAULT_SCREEN;
				}
				break;

			case ARMING:
				ssd1306_Print_arming_screen();
				if(flag_BUTTON_cliked){
					flag_BUTTON_cliked = 0;
					current_state = DEFAULT_SCREEN;
				}
				break;

			case DISARMING:
				ssd1306_Print_disarming_screen();
				if(flag_BUTTON_cliked){
					flag_BUTTON_cliked = 0;
					current_state = DEFAULT_SCREEN;
				}
				break;

			case COUNTING_DOWN:
				ssd1306_Print_counting_screen();
				//counting 10sek to fire
				if( (HAL_GPIO_ReadPin(FIRE_GPIO_Port, FIRE_Pin) == 0) && Actual_data.soft_arm){
					flag_FIRE_cliked = 0;
					current_state = LAUNCH;
				}else{
					flag_FIRE_cliked = 0;
					current_state = DISARMING;
				}
				break;

			case LAUNCH:
				ssd1306_Print_launch_screen();
				//delay 1-2sek
				current_state = DEFAULT_SCREEN;
				break;

		}


		if(flag_new_position){
			flag_new_position = 0;

			//str_lat
			int position = 3;
			int length = 8;
			int c = 0;
			while (c < length) {
				str_lat[c] = buffer[position + c - 1];
				c++;
			}
			str_lat[c] = '\0';

			//str_lat
			position = 12;
			length = 8;
			c = 0;
			while (c < length) {
				str_lon[c] = buffer[position + c - 1];
				c++;
			}
			str_lon[c] = '\0';

			//str_alt
			position = 21;
			length = 5;
			c = 0;
			while (c < length) {
				str_alt[c] = buffer[position + c - 1];
				c++;
			}
			str_alt[c] = '\0';

			//str_alt
			position = 27;
			length = 4;
			c = 0;
			while (c < length) {
				str_vel[c] = buffer[position + c - 1];
				c++;
			}
			str_vel[c] = '\0';

			//float lat, lon, alt, vel;

			sscanf(str_lat,"%f",&Actual_data.latitude);
			sscanf(str_lon,"%f",&Actual_data.longitude);
			sscanf(str_alt,"%f",&Actual_data.altitude);
			sscanf(str_vel,"%f",&Actual_data.velocity);
			Actual_data.rssi = SX1278_RSSI_LoRa(&SX1278);
			Actual_data.snr = SX1278_SNR_LoRa(&SX1278);

			HAL_RTC_GetTime(&hrtc, &RtcTime, RTC_FORMAT_BIN);
			HAL_RTC_GetDate(&hrtc, &RtcDate, RTC_FORMAT_BIN);

			Actual_data.soft_arm = 1;

			//ssd1306_Print(lat, lon, alt, vel, V_Bat, rssi, snr, RtcTime.Hours, RtcTime.Minutes, RtcTime.Seconds);
			//writeUART(lat, lon, alt, vel, rssi, snr);
			writeUART2(Actual_data.latitude, Actual_data.longitude, name++);
			//ssd1306_Print(Actual_data.latitude, Actual_data.longitude, Actual_data.altitude, Actual_data.velocity, V_Bat, Actual_data.rssi, Actual_data.snr, RtcTime.Hours, RtcTime.Minutes, RtcTime.Seconds);
//			switch (positions)
//			{
//				case 0:
//
//					break;
//				case 1:
//					ssd1306_Print_1screen();
//					break;
//				case 2:
//					ssd1306_Print_2screen();
//					break;
//				case 3:
//					ssd1306_Print_3screen();
//					break;
//				case 4:
//					ssd1306_Print_menu();
//					if(flag_BUTTON_cliked){
//						flag_BUTTON_cliked = 0;
//						while(!flag_BUTTON_cliked){
//							ssd1306_Print_inmenu();
//						}
//						flag_BUTTON_cliked = 0;
//					}
//					break;
//				default:
//
//					break;
//			}

			//printf("Date: %02d.%02d.20%02d Time: %02d:%02d:%02d\n\r", RtcDate.Date, RtcDate.Month, RtcDate.Year, RtcTime.Hours, RtcTime.Minutes, RtcTime.Seconds);
			Beep(2);
		}

		  if (adc_flag == 1 ){
			  adc_flag=0;
			  V_Bat = adc_value * (4.2/4096) *1.33;
			  HAL_ADC_Start_IT(&hadc1);
		  }

		  pulse_count = TIM1->CNT; // przepisanie wartosci z rejestru timera
		  positions = pulse_count/4; // zeskalowanie impulsow do liczby stabilnych pozycji walu enkodera

//		if(zmiana){
//			zmiana = false;
//			update_screen(current_state, RtcDate, RtcTime, Actual_data, positions);
//		}
//		watchdog++;
//		HAL_Delay(100);
//		if(watchdog >= 50){
//			ssd1306_Print_No_Signal(V_Bat);
//			Beep(200);
//		}
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC|RCC_PERIPHCLK_ADC
                              |RCC_PERIPHCLK_USB;
  PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
  PeriphClkInit.UsbClockSelection = RCC_USBCLKSOURCE_PLL_DIV1_5;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief NVIC Configuration.
  * @retval None
  */
static void MX_NVIC_Init(void)
{
  /* SPI1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SPI1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(SPI1_IRQn);
}

/* USER CODE BEGIN 4 */

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	if(GPIO_Pin == DO_RF_Pin){
			ret = SX1278_LoRaRxPacket(&SX1278);
				 	if (ret > 0) {
				 		SX1278_read(&SX1278, (uint8_t *) buffer, ret);
					 	//printf("Zawartość pakietu (%d): %s\r\n", ret, buffer);
					 	flag_new_position = 1;
				 	}
				 	HAL_GPIO_TogglePin(LED_GPIO_Port, LED_Pin);
		}
	if(GPIO_Pin == BUTTON_Pin){
			flag_BUTTON_cliked = 1;
		}
	if(GPIO_Pin == FIRE_Pin){
			flag_FIRE_cliked = 1;
		}
}

void HAL_ADC_ConvCpltCallback( ADC_HandleTypeDef *hadc){
	if(hadc == &hadc1){
		adc_flag = 1;
		adc_value = HAL_ADC_GetValue(hadc);
	}
}

void LED_blink(int blink_times, int time){

    for(int i = 0; i < blink_times; i++){
        //blue pill set-wyłączona, reset-włączona
        HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_SET);
        HAL_Delay(time);
        HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_RESET);
        HAL_Delay(time);
    }
    HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_SET);
}

void Beep(int time_delay){
	HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, GPIO_PIN_SET);
	HAL_Delay(time_delay);
	HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, GPIO_PIN_RESET);
}

int _write(int file, char *ptr, int len){
    HAL_UART_Transmit(&huart2, (uint8_t*)ptr, len, 50);
    CDC_Transmit_FS((uint8_t*)ptr, len);
    return len;
}

int writeUART(float latitude, float longitude, float altitude, float velocity, int rssi, int snr){
    return printf("%f/%f/%f/%f/%d/%d\n\r", latitude, longitude, altitude, velocity, rssi, snr);
}

int writeUART2(float latitude, float longitude, int name){
    return printf("{\"lat\":\"%f\",\"lon\":\"%f\",\"name\":%d}\r\n", latitude, longitude, name);
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
