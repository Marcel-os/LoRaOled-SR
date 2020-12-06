/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */
typedef struct {
	float latitude;
	float longitude;
	float altitude;
	int hours;
	int minutes;
	int seconds;
	float hdop;
	int satelites;
	int fix;
	int rssi;
	int snr;
	_Bool soft_arm;
} ROCKET_DATA;


/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define LED_Pin GPIO_PIN_13
#define LED_GPIO_Port GPIOC
#define VBAT_Pin GPIO_PIN_0
#define VBAT_GPIO_Port GPIOA
#define BUZZER_Pin GPIO_PIN_1
#define BUZZER_GPIO_Port GPIOA
#define TX_USB_Pin GPIO_PIN_2
#define TX_USB_GPIO_Port GPIOA
#define RX_USB_Pin GPIO_PIN_3
#define RX_USB_GPIO_Port GPIOA
#define RST_RF_Pin GPIO_PIN_0
#define RST_RF_GPIO_Port GPIOB
#define BUTTON_Pin GPIO_PIN_1
#define BUTTON_GPIO_Port GPIOB
#define BUTTON_EXTI_IRQn EXTI1_IRQn
#define DO_RF_Pin GPIO_PIN_12
#define DO_RF_GPIO_Port GPIOB
#define DO_RF_EXTI_IRQn EXTI15_10_IRQn
#define CS_RF_Pin GPIO_PIN_15
#define CS_RF_GPIO_Port GPIOA
#define SCK_RF_Pin GPIO_PIN_3
#define SCK_RF_GPIO_Port GPIOB
#define MISO_RF_Pin GPIO_PIN_4
#define MISO_RF_GPIO_Port GPIOB
#define MOSI_RF_Pin GPIO_PIN_5
#define MOSI_RF_GPIO_Port GPIOB
#define FIRE_Pin GPIO_PIN_6
#define FIRE_GPIO_Port GPIOB
#define FIRE_EXTI_IRQn EXTI9_5_IRQn
#define D_C_Pin GPIO_PIN_7
#define D_C_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
