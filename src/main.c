#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <nvs_flash.h>
#include "wifi.h"

void init_flash() {
    
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
}

void setup() {
    init_flash();
    wifi_init();
}

void app_main() {

    setup();

    while(1) {
        wifi_scan();
        vTaskDelay(1000/portTICK_PERIOD_MS);
    }
}