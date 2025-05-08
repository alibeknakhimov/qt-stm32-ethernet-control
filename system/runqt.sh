#!/bin/bash

# Переменные окружения для EGLFS
export QT_QPA_EGLFS_KMS_CONFIG=/home/mycontroller/eglfs.json
export QT_QPA_EGLFS_HIDECURSOR=1

# Переход в директорию сборки
cd /home/mycontroller/kk/build

# Запуск Qt-приложения
./kk -platform eglfs