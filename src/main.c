#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <flash.h>
#include <wifi.h>

void setup() {
    flash_init();
    wifi_init();
}

void app_main() {

    setup();

    while(1) {
        wifi_scan();
        vTaskDelay(1000/portTICK_PERIOD_MS);
    }
}