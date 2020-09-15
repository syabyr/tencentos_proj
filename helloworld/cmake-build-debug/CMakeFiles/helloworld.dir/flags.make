# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile ASM with /usr/local/bin/arm-none-eabi-g++
# compile C with /usr/local/bin/arm-none-eabi-gcc
ASM_FLAGS = -Wextra -Wall -Wno-unused-parameter -mcpu=cortex-m4 -mthumb -fno-builtin -ffunction-sections -fdata-sections -fomit-frame-pointer -mfpu=fpv4-sp-d16 -mfloat-abi=hard  -x assembler-with-cpp -DLOOP_ADDR=0x8000 -O0 -g -gdwarf-2  

ASM_DEFINES = -DSTM32F401xC -DUSE_HAL_DRIVER

ASM_INCLUDES = -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/kernel/core/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/kernel/pm/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/arch/arm/arm-v7m/common/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/arch/arm/arm-v7m/cortex-m4/gcc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/osal/cmsis_os -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc/Legacy -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/CMSIS/Device/ST/STM32F4xx/Include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/CMSIS/Include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./BSP/Inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./TOS_CONFIG 

C_FLAGS = -std=gnu99 -Wextra -Wall -Wno-unused-parameter -mcpu=cortex-m4 -mthumb -fno-builtin -ffunction-sections -fdata-sections -fomit-frame-pointer -mfpu=fpv4-sp-d16 -mfloat-abi=hard   --specs=nano.specs -MMD -MP -O0 -g -gdwarf-2  

C_DEFINES = -DSTM32F401xC -DUSE_HAL_DRIVER

C_INCLUDES = -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/kernel/core/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/kernel/pm/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/arch/arm/arm-v7m/common/include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/arch/arm/arm-v7m/cortex-m4/gcc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/osal/cmsis_os -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc/Legacy -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/CMSIS/Device/ST/STM32F4xx/Include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/../../TencentOS-tiny/platform/vendor_bsp/st/CMSIS/Include -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./BSP/Inc -I/Users/mybays/develop/tencentos-tiny/project/helloworld/./TOS_CONFIG 

