#ifndef _EXAMPLE_WIFI_H
#define _EXAMPLE_WIFI_H
#include <esp_wifi.h>
void wifi_init(void);
esp_ip4_addr_t* wifi_get_ip();

#endif