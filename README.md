# ha-bleeding-edge - Home Assistant Bleeding Edge repository.
**Bleeding Edge Gentoo Overlay for Home Assistant**

https://www.home-assistant.io/ https://github.com/home-assistant/home-assistant

[![OS](https://img.shields.io/badge/OS-Gentoo%20Linux-blue)](https://www.gentoo.org/)
[![weekly commits](https://img.shields.io/github/commit-activity/w/tabascoz/ha-bleeding-edge)](https://github.com/tabascoz/ha-bleeding-edge/commits/)


This repository is based on the work of the excellent [HomeAssistantRepository](https://git.edevau.net/onkelbeh/HomeAssistantRepository) by onkelbeh.

## Goal

The primary goal of this overlay is to provide **bleeding-edge versions** of Home Assistant, with a strong focus on the `app-misc/homeassistant-full` package. This includes untested ebuilds that usually pull directly from the latest development branch or pre-release/beta versions of Home Assistant core and its dependencies, giving users access to the newest features and fixes as soon as they land upstream.

## Important Notes

- **Bleeding-edge means unstable**. These versions may introduce bugs, breaking changes, incomplete features, or dependency conflicts.
- **Testing is encouraged, use in production at your discretion **. Always create full backups of your Home Assistant configuration and database before installing or updating packages from this overlay.

## Maintenance

Most of the current HA components are translated in USE flags. I'll implement new flags **as time permits**. Contributions, bug reports, suggestions, and pull requests are very welcome!

## Current USE Flags (homeassistant-full)

The `homeassistant-full` ebuild includes an extensive set of USE flags for optional integrations. The list below represents the flags that are currently available and **tested** in my own setup:

aemet androidtv androidtv_remote apple_tv backup bluetooth bthome camera cast co2signal deluge ecowitt esphome ffmpeg forecast_solar frontend fully_kiosk go2rtc google google_assistant_sdk google_cloud google_generative_ai_conversation google_photos google_translate google_weather growatt_server home_connect html5 ibeacon influxdb inkbird iperf3 ipma ipp isal lg_soundbar lg_thinq luci marytts matter meteoalarm meteoclimatic mobile_app mqtt network notify_events ollama omie onvif open_meteo openai_conversation openexchangerates openweathermap otp ping profiler proxy pushover pvoutput python_script recorder rest roborock samsungtv shelly smartthings speedtestdotnet spotify sql stream systemd tasmota tesla_fleet teslemetry thread todoist tomorrowio tts tuya ubus upnp usb utility_meter version victron_ble weatherkit xiaomi_aqara xiaomi_ble xiaomi_miio zeroconf

> Homeassistant package is being maintained with all integrations and their correct dependency requests as per upstream. Some dependencies have been bumped or downgraded to either keep compatibility with Gentoo and/or to test new functionality. 
> 

Overlay is tested with Python 3.14 only. Should also work with 3.13.  

## Installation

Add the overlay to your system:

1. run

```
eselect repository enable ha-bleeding-edge
```


2. Sync the overlay(s):

```
emaint sync -r ha-bleeding-edge
```
optionally (recommended) run:
```
emerge --sync
```

3. Install or upgrade Home Assistant:

```
emerge -av app-misc/homeassistant-full
```

Stay on the cutting edge — but test thoroughly! This overlay is inspired by and heavily based on the outstanding work in [onkelbeh/HomeAssistantRepository](https://github.com/onkelbeh/HomeAssistantRepository). Full credit to the original maintainers and all contributors.

## Update #1 2026-05

- Heavily cleaned up and tested wider range of useflags and successfull installation, so expect more stuff to work. Mind that is virtually impossible for me to test all their functionality. 
- Synced useflags with 2026.5.1 version, removed old stuff and updated their dependencies.
- some packages are pinned to more updated versions than HA. 

Current all-tested flags are: aemet androidtv androidtv_remote apple_tv backup bluetooth bthome camera cast co2signal deluge ecowitt esphome ffmpeg forecast_solar frontend fully_kiosk go2rtc google google_assistant_sdk google_cloud google_generative_ai_conversation google_photos google_translate google_weather growatt_server home_connect html5 ibeacon influxdb inkbird iperf3 ipma ipp isal lg_soundbar lg_thinq luci marytts matter meteoalarm meteoclimatic mobile_app mqtt network notify_events ollama omie onvif open_meteo openai_conversation openexchangerates openweathermap otp ping profiler proxy pushover pvoutput python_script recorder rest roborock samsungtv shelly smartthings speedtestdotnet spotify sql stream systemd tasmota tesla_fleet teslemetry thread todoist tomorrowio tts tuya ubus upnp usb utility_meter version victron_ble weatherkit xiaomi_aqara xiaomi_ble xiaomi_miio zeroconf


