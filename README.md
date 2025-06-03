
# Qt5 GUI → STM32 (Bare Metal) via Ethernet

This project demonstrates a full-stack embedded control system where a **Qt5 GUI application**, running on a **Raspberry Pi 5**, communicates with a **bare-metal STM32F103C8T6** microcontroller via **Ethernet** using a **CH9121** UART-to-Ethernet bridge. The system enables real-time relay control using a custom UTF-8 command protocol.

[![Watch the demo](docs/thumbnail.png)](https://youtube.com/shorts/BL4TQFjsRmY?si=G8JpCt_BM3iExTb5)  
📺 **Click the image above to watch the video demo**

---

## 🔧 Features

- 💻 Qt5 GUI in **fullscreen EGLFS mode** (no X11, no Wayland)
- 🧠 STM32 firmware written **bare-metal** (no HAL, no RTOS)
- 📡 Ethernet communication via **CH9121** (UART-to-Ethernet bridge)
- 🔁 Real-time **relay control** via TCP
- 📜 UTF-8 based string protocol, parsed on STM32
- 🛠 Auto-start with `systemd` + splash screen
- 🧰 100% self-built project (code, configs, integration)

---

## 🗂 Project Structure

| Folder            | Description                                  |
|-------------------|----------------------------------------------|
| `qt_app/`         | Qt5 GUI app that sends TCP commands          |
| `stm32_firmware/` | STM32 C code, UART config + main logic       |
| `system/`         | Linux service setup: splash, autostart       |
| `docs/`           | Diagrams, screenshots, thumbnails            |

---

## 📷 GUI Screenshot

![Qt GUI Screenshot](docs/gui.png)

---

## 🚀 Quick Start

### 💻 Qt App (on Raspberry Pi)
```bash
sudo apt install qt5-default
cd qt_app
mkdir build && cd build
cmake ..
make
./ethernet-gui -platform eglfs
````

### 🔌 STM32 Setup

1. Flash `stm32_firmware/setup_uart_config.hex`
   *(configures CH9121 to operate as TCP client)*
2. Flash `stm32_firmware/main_logic.hex`
   *(parses UTF-8 strings and controls relays)*
3. Connect CH9121 to STM32 via UART (TX/RX + GND)

---

## 🧭 Architecture Diagram

```mermaid
flowchart TD
    subgraph Linux_SBC[Raspberry Pi 5]
        GUI[Qt5 GUI App]
        Systemd[Systemd Autostart + EGLFS]
    end
    subgraph Network[Ethernet LAN]
        LAN[LAN Cable or Switch]
    end
    subgraph STM32_side[STM32 Hardware]
        CH9121[CH9121 TCP↔UART Bridge]
        STM32[STM32F103C8T6 (bare-metal)]
        Relays[Relay Modules]
    end

    GUI -->|TCP Command| LAN --> CH9121 -->|UART| STM32 --> Relays
```

---

## 🛠 Tools & Environment

* **Platform:** Raspberry Pi 5 (64-bit Raspberry Pi OS)
* **GUI Toolkit:** Qt5.15 (EGLFS mode)
* **Microcontroller:** STM32F103C8T6 (Blue Pill)
* **Network Bridge:** CH9121 UART ↔ Ethernet
* **Compiler:** `arm-none-eabi-gcc`
* **Flash tools:** STM32CubeProgrammer or stlink
* **System integration:** `systemd`, Bash scripts, splash screen

---

## 🎓 What I Learned

* How to write **bare-metal STM32 firmware** using register-level programming
* Configuring the **CH9121 Ethernet bridge** via UART
* Designing and parsing **simple UTF-8 command protocols**
* Running Qt5 in **EGLFS mode** without X11 or Wayland
* Automating GUI startup using **systemd** and splash services
* Working with **cross-compilation**, headless SBCs, and low-level networking

---

## 🚧 Roadmap

* [ ] Add reconnect/retry TCP logic on STM32
* [ ] Add Qt GUI config for IP address and port
* [ ] Package GUI as `.AppImage` for deployment
* [ ] CI/CD pipeline for automated build/test (Qt & STM32)
* [ ] Unit-tests for command parsing logic

---

## 📜 License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.

---

## 🙋 About the Author

Everything in this project—from UI design to embedded code and system integration—was implemented from scratch by me as a demonstration of embedded systems engineering.
Feel free to reach out or open issues if you're interested in contributing or learning more.

```


