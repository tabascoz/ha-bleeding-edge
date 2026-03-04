# ha-bleeding-edge - Home Assistant Bleeding Edge repository.
**Bleeding Edge Gentoo Overlay for Home Assistant**

https://www.home-assistant.io/ https://github.com/home-assistant/home-assistant

[![OS](https://img.shields.io/badge/OS-Gentoo%20Linux-blue)](https://www.gentoo.org/)
[![weekly commits](https://img.shields.io/github/commit-activity/w/tabascoz/ha-bleeding-edge)](https://github.com/tabascoz/ha-bleeding-edge/commits/)


This repository is based on the work of the excellent [HomeAssistantRepository](https://git.edevau.net/onkelbeh/HomeAssistantRepository) by onkelbeh.

## Goal

The primary goal of this overlay is to provide **bleeding-edge versions** of Home Assistant, with a strong focus on the `app-misc/homeassistant-full` package. This includes untested ebuilds that usually pull directly from the latest development branch or pre-release/beta versions of Home Assistant core and its dependencies, giving users access to the newest features and fixes as soon as they land upstream.

## Important Notes

- This work **heavily relies on packages and ebuilds from the original HomeAssistantRepository**. Most ebuilds are derived, synced, or directly based on the upstream work, with modifications to enable bleeding-edge versioning.
- **Bleeding-edge means unstable**. These versions may introduce bugs, breaking changes, incomplete features, or dependency conflicts.
- **Testing is encouraged, but use in production is not advised**. Always create full backups of your Home Assistant configuration and database before installing or updating packages from this overlay.

## Maintenance

I am happy to work on additional ebuilds and USE flags to support more components **as time permits**. Contributions, bug reports, suggestions, and pull requests are very welcome!

## Current USE Flags (homeassistant-full)

The `homeassistant-full` ebuild includes an extensive set of USE flags for optional integrations. The list below represents the flags that are currently available and **more or less tested** in my own setup:

aemet androidtv androidtv_remote apple_tv backup bluetooth bthome caldav camera cast co2signal deluge dht ecowitt esphome ffmpeg forecast_solar fully_kiosk google google_assistant_sdk google_cloud google_generative_ai_conversation google_photos google_translate google_weather growatt_server home_connect html5 http ibeacon influxdb inkbird iperf3 ipma ipp isal lg_soundbar lg_thinq luci mariadb marytts matter meteoalarm meteoclimatic mobile_app mosquitto mqtt mysql network notify_events ollama onvif open_meteo openai_conversation openexchangerates openweathermap otp ping plex profiler proxy pushover pvoutput python_script recorder rest roborock rtsp_to_webrtc samsungtv scrape shelly smartthings speedtestdotnet spotify sql stream systemd tasmota tesla_fleet teslemetry todoist tomorrowio tts tuya ubus upnp usb utility_meter version victron_ble weatherkit xiaomi_aqara xiaomi_ble xiaomi_miio zeroconf

> **Note**: This is only a partial preview of the full list. The complete list can be viewed with `eix app-misc/homeassistant-full` after syncing the overlay. Not every flag is exhaustively tested — some are still to be fully implemented. Feedback and requests are appreciated!
> Homeassistant package is being maintained with all integrations and their correct dependency requests as per upstream, however the python dependencies themselves not part of the useflags above  are not being "all" actively maintained by be as it is a tremendous work. Pypi repository may have most of the dependencies. If you need support with a particular dependency or useflag, raise an Issue and I'll see what i can do.

Ha and most of the HA ecossystem packages are ready and should be running fine with python3_14. 

## Installation

Add the overlay to your system:

1. Create the repos.conf entry:

```ini
# /etc/portage/repos.conf/ha-bleeding-edge.conf
[ha-bleeding-edge]
location = /var/db/repos/ha-bleeding-edge
sync-type = git
sync-uri = https://github.com/tabascoz/ha-bleeding-edge.git
auto-sync = yes
priority = 50
```

2. Sync the overlay:

```
emerge --sync
```

3. Install or upgrade Home Assistant:

```
emerge -av app-misc/homeassistant-full
```

Stay on the cutting edge — but test thoroughly! This overlay is inspired by and heavily based on the outstanding work in [onkelbeh/HomeAssistantRepository](https://github.com/onkelbeh/HomeAssistantRepository). Full credit to the original maintainers and all contributors.
