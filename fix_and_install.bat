@echo off
chcp 65001 >nul
title Metrostroi RPC - Fix & Installer

echo ==================================================
echo   Metrostroi RPC auto installer and fixer
echo ==================================================
echo.

rem -------------------
rem Detect Python (try python then py)
rem -------------------
where python >nul 2>&1
if %errorlevel%==0 goto :PY_FOUND_PY

where py >nul 2>&1
if %errorlevel%==0 goto :PY_FOUND_PYLAUNCHER

goto :PY_NOTFOUND

:PY_FOUND_PY
set "PY_CMD=python"
goto :PY_CHECK

:PY_FOUND_PYLAUNCHER
set "PY_CMD=py -3"
goto :PY_CHECK

:PY_NOTFOUND
echo [ERROR] Python/py not found in PATH.
echo Please install Python from https://www.python.org/ and enable "Add Python to PATH".
echo Press any key to open download page...
pause >nul
start "" "https://www.python.org/downloads/"
exit /b 1

:PY_CHECK
echo [OK] Using Python command: %PY_CMD%
echo.

rem -------------------
rem Check pip
rem -------------------
echo [STEP] Проверяем pip...
%PY_CMD% -m pip --version >nul 2>&1
if %errorlevel%==0 (
    echo [OK] pip найден.
    goto :PIP_OK
)

echo [INFO] pip не найден или недоступен. Попытка установить через ensurepip...
%PY_CMD% -m ensurepip --default-pip >nul 2>&1
if %errorlevel%==0 (
    echo [OK] pip установлен через ensurepip.
    goto :PIP_OK
)

echo [INFO] ensurepip не сработал. Попытка скачать get-pip.py через PowerShell...
set "GETPIP=%TEMP%\get-pip.py"
powershell -NoProfile -Command "try { (New-Object System.Net.WebClient).DownloadFile('https://bootstrap.pypa.io/get-pip.py','%GETPIP%'); exit 0 } catch { exit 1 }" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Не удалось скачать get-pip.py автоматически. Установите pip вручную.
    echo Попробуйте вручную: %PY_CMD% -m ensurepip --default-pip
    pause
    exit /b 1
)

echo [INFO] Запускаем установку pip (%GETPIP%)...
%PY_CMD% "%GETPIP%"
if %errorlevel% neq 0 (
    echo [ERROR] Установка pip через get-pip.py завершилась с ошибкой.
    del "%GETPIP%" >nul 2>&1
    pause
    exit /b 1
)
del "%GETPIP%" >nul 2>&1
echo [OK] pip установлен.
goto :PIP_OK

:PIP_OK
echo.

rem -------------------
rem Upgrade pip & install requirements
rem -------------------
echo [STEP] Обновляем pip/setuptools/wheel...
%PY_CMD% -m pip install --upgrade pip setuptools wheel
if %errorlevel% neq 0 (
    echo [WARN] Не удалось обновить pip/setuptools/wheel. Продолжаем попытку установки пакетов.
)

echo [STEP] Устанавливаем Python-зависимости: pypresence flask requests colorama
%PY_CMD% -m pip install pypresence flask requests colorama
if %errorlevel%==0 (
    echo [OK] Python зависимости установлены.
) else (
    echo [ERROR] Ошибка при установке Python-зависимостей.
    echo Попробуйте выполнить вручную:
    echo    %PY_CMD% -m pip install pypresence flask requests colorama
)

echo.

rem -------------------
rem Check npm and install localtunnel
rem -------------------
echo [STEP] Проверяем npm (Node.js)...
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARN] npm не найден. Для установки localtunnel требуется Node.js: https://nodejs.org/
) else (
    echo [OK] npm найден. Устанавливаем localtunnel глобально...
    npm install -g localtunnel
    if %errorlevel%==0 (
        echo [OK] localtunnel установлен.
    ) else (
        echo [WARN] Ошибка при установке localtunnel через npm.
        echo Попробуйте вручную: npm install -g localtunnel
    )
)

echo.
echo ==================================================
echo  Завершено. Проверьте сообщения выше на предмет ошибок.
echo  Для ручной установки Python-зависимостей выполните:
echo    %PY_CMD% -m pip install pypresence flask requests colorama
echo ==================================================
pause
exit /b 0
