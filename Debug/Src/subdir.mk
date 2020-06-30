################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/SX1278.c \
../Src/adc.c \
../Src/gpio.c \
../Src/i2c.c \
../Src/main.c \
../Src/rtc.c \
../Src/spi.c \
../Src/ssd1306.c \
../Src/ssd1306_fonts.c \
../Src/ssd1306_tests.c \
../Src/stm32f1xx_hal_msp.c \
../Src/stm32f1xx_it.c \
../Src/syscalls.c \
../Src/system_stm32f1xx.c \
../Src/tim.c \
../Src/usart.c \
../Src/usb_device.c \
../Src/usbd_cdc_if.c \
../Src/usbd_conf.c \
../Src/usbd_desc.c 

OBJS += \
./Src/SX1278.o \
./Src/adc.o \
./Src/gpio.o \
./Src/i2c.o \
./Src/main.o \
./Src/rtc.o \
./Src/spi.o \
./Src/ssd1306.o \
./Src/ssd1306_fonts.o \
./Src/ssd1306_tests.o \
./Src/stm32f1xx_hal_msp.o \
./Src/stm32f1xx_it.o \
./Src/syscalls.o \
./Src/system_stm32f1xx.o \
./Src/tim.o \
./Src/usart.o \
./Src/usb_device.o \
./Src/usbd_cdc_if.o \
./Src/usbd_conf.o \
./Src/usbd_desc.o 

C_DEPS += \
./Src/SX1278.d \
./Src/adc.d \
./Src/gpio.d \
./Src/i2c.d \
./Src/main.d \
./Src/rtc.d \
./Src/spi.d \
./Src/ssd1306.d \
./Src/ssd1306_fonts.d \
./Src/ssd1306_tests.d \
./Src/stm32f1xx_hal_msp.d \
./Src/stm32f1xx_it.d \
./Src/syscalls.d \
./Src/system_stm32f1xx.d \
./Src/tim.d \
./Src/usart.d \
./Src/usb_device.d \
./Src/usbd_cdc_if.d \
./Src/usbd_conf.d \
./Src/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
Src/SX1278.o: ../Src/SX1278.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/SX1278.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/adc.o: ../Src/adc.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/adc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/gpio.o: ../Src/gpio.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/gpio.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/i2c.o: ../Src/i2c.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/i2c.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/main.o: ../Src/main.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/main.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/rtc.o: ../Src/rtc.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/rtc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/spi.o: ../Src/spi.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/spi.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/ssd1306.o: ../Src/ssd1306.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/ssd1306.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/ssd1306_fonts.o: ../Src/ssd1306_fonts.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/ssd1306_fonts.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/ssd1306_tests.o: ../Src/ssd1306_tests.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/ssd1306_tests.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/stm32f1xx_hal_msp.o: ../Src/stm32f1xx_hal_msp.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/stm32f1xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/stm32f1xx_it.o: ../Src/stm32f1xx_it.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/stm32f1xx_it.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/syscalls.o: ../Src/syscalls.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/syscalls.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/system_stm32f1xx.o: ../Src/system_stm32f1xx.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/system_stm32f1xx.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/tim.o: ../Src/tim.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/tim.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/usart.o: ../Src/usart.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/usart.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/usb_device.o: ../Src/usb_device.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/usb_device.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/usbd_cdc_if.o: ../Src/usbd_cdc_if.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/usbd_cdc_if.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/usbd_conf.o: ../Src/usbd_conf.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/usbd_conf.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Src/usbd_desc.o: ../Src/usbd_desc.c
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32-projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I/Users/marceldomagala/Documents/STM32-Projects/LoRaOled/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/usbd_desc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

