#ifndef __MCU_INIT_H
#define __MCU_INIT_H
#ifdef __cplusplus
 extern "C" {
#endif

#include "main.h"
#include "stm32g0xx_hal.h"
#include "usart.h"
#include "gpio.h"
#include "adc.h"
#include "i2c.h"
#include "spi.h"
#include "tos_k.h"

void board_init(void);
void SystemClock_Config(void);

#ifdef __cplusplus
}
#endif
#endif /*__ __MCU_INIT_H */
