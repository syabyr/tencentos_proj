# Base TencentOS-Tiny CMake file
#
#
# This file is covered under the MIT license available at: https://opensource.org/licenses/MIT

###### Project Environment #####

# Set minimum CMake version
cmake_minimum_required(VERSION 2.8.4)

# Optional verbose mode, uncomment or pass in -DCMAKE_VERBOSE_MAKEFILE=ON
set(CMAKE_VERBOSE_MAKEFILE ON)

set(BASE_LOCATION ../../tencentos-tiny)
message ( STATUS "BASE_LOCATION = ${BASE_LOCATION}.")

set(BOARD TencentOS_Tiny_EVB_G0)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_AR arm-none-eabi-ar)


# Set the compiler (must be prior to project setup)
include(./toolchain/arm-gcc.cmake)

##### Project Setup #####

# Configure project and languages
project(hello_world C CXX ASM)

# Set device
if (NOT DEVICE)
    set(DEVICE STM32F401xC)
endif ()

set(CPU_TYPE "m4")

# Set build
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE DEBUG)
endif ()


##### Modules #####

# Libraries can be added to the LIBS variable
# or manually included here.

# Add base libs (emlib, CMSIS, device files)
include(./toolchain/stm32-base.cmake)


set(LINKER_SCRIPT "../GCC/hello_world/STM32F401CCUx_FLASH.ld") 


# This is normally set in stm32-base.cmake, but libraries may modify it so set
# it after libraries/subdirectories have been added
set(CMAKE_EXE_LINKER_FLAGS "${COMMON_DEFINITIONS} -Xlinker -T${LINKER_SCRIPT} -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.map -Wl,--gc-sections -Wl,-v")

##### Header & Source Files #####

#TencentOS-Tiny kernel
include_directories(${BASE_LOCATION}/kernel/core/include)
include_directories(${BASE_LOCATION}/kernel/pm/include)
include_directories(${BASE_LOCATION}/kernel/hal/include)

aux_source_directory(${BASE_LOCATION}/kernel/core/ SOURCE_FILES)
aux_source_directory(${BASE_LOCATION}/kernel/pm/ SOURCE_FILES)


#Operating system abstraction layer header
include_directories(${BASE_LOCATION}/osal/cmsis_os)
#aux_source_directory(${BASE_LOCATION}/osal/cmsis_os/ SOURCE_FILES)
set(OSAL_SOURCE  ${BASE_LOCATION}/osal/cmsis_os/cmsis_os.c)

#CPU Architecture header
include_directories(${BASE_LOCATION}/arch/arm/arm-v7m/common/include)
include_directories(${BASE_LOCATION}/arch/arm/arm-v7m/cortex-m4/gcc)

aux_source_directory(${BASE_LOCATION}/arch/arm/arm-v7m/cortex-m4/gcc/ SOURCE_FILES)
aux_source_directory(${BASE_LOCATION}/arch/arm/arm-v7m/common/ SOURCE_FILES)


#Chip Specified header
include_directories(${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc)
include_directories(${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Inc/Legacy)
include_directories(${BASE_LOCATION}/platform/vendor_bsp/st/CMSIS/Device/ST/STM32F4xx/Include)
include_directories(${BASE_LOCATION}/platform/vendor_bsp/st/CMSIS/Include)

#Specified HAL_Driver Source
set(HAL_SOURCE  ${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c 
		${BASE_LOCATION}/platform/vendor_bsp/st/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c)




#Project Driver header
include_directories(./BSP/Inc)
aux_source_directory(./BSP/Src SOURCE_FILES)

include_directories(./inc)
include_directories(./TOS_CONFIG)



set(AS_SOURCE ${BASE_LOCATION}/arch/arm/arm-v7m/cortex-m4/gcc/port_s.S
		./GCC/hello_world/startup_stm32f401xc.s)



#printf float support
link_libraries("-u _printf_float")

# Generate executable and link
add_executable(${PROJECT_NAME}
	${AS_SOURCE}
	${OSAL_SOURCE}
	${HAL_SOURCE}
	${SOURCE_FILES})

stm32_configure_linker_addresses(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} ${LIBS} c nosys)

# Link optional libraries if available
#if (${HAS_HARDWARE})
#    target_link_libraries(${PROJECT_NAME} hardware)
#endif ()


##### Post build #####

# Add post build commands
include(./toolchain/post-build.cmake)

# Add stlink commands
include(./toolchain/stlink.cmake)

##### CMake debug prints #####
if (CMAKE_VERBOSE_MAKEFILE)
    print_debug_info()
endif()
