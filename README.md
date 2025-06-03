# Qt5 GUI → STM32 (Bare Metal) via Ethernet

This project demonstrates how a Qt5 application running on a **single-board computer** controls a **bare-metal STM32** microcontroller over Ethernet using TCP protocol.

[![Watch the demo](docs/thumbnail.png)](https://youtube.com/shorts/BL4TQFjsRmY?si=G8JpCt_BM3iExTb5)
📺 **Click the image above to watch the video demo**
---

## 🔧 Features

- 🧱 STM32 runs **bare-metal** (no HAL, no RTOS)
- 📶 TCP communication over Ethernet (direct LAN)
- 🖥 Qt5 app running **fullscreen with EGLFS** (no X11 or Wayland)
- ⚙️ Systemd-based splash screen and autostart
- ⚡️ Real-time relay control via GUI

---

## 🗂 Folder Structure

| Folder            | Description                             |
|-------------------|-----------------------------------------|
| `qt_app/`         | Qt5 GUI project                         |
| `stm32_firmware/` | STM32 C project (TCP client)            |
| `system/`         | Embedded Linux system configs (systemd) |
| `docs/`           | Images, diagrams, thumbnail             |

---

## 🚀 Quick Start

### ▶️ Qt App (on SBC)
```bash
cd qt_app
mkdir build
cd build
cmake.. 
make
./yourapp -platform eglfs


flowchart TD
    subgraph Linux SBC (Raspberry Pi 5)
        A[Qt5 GUI App]
        B[Systemd Autostart + EGLFS]
    end
    subgraph Ethernet LAN
        L1[LAN Switch or Direct Cable]
    end
    subgraph STM32 Side
        C[CH9121 TCP↔UART]
        D[STM32 (bare-metal)]
        E[Relay Modules]
    end

    A -->|TCP| L1 --> C -->|UART| D --> E

