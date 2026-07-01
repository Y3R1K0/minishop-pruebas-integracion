@echo off
setlocal

REM Cambia esta ruta si descomprimiste JMeter en otro lugar.
set JMETER_BIN=C:\jmeter\apache-jmeter-5.6.3\bin\jmeter.bat

set BASE_DIR=%~dp0
set JMX=%BASE_DIR%minishop-load-test.jmx
set JTL=%BASE_DIR%resultados.jtl
set REPORT=%BASE_DIR%reporte-html
set ZIP=%BASE_DIR%reporte-html.zip

if exist "%JTL%" del "%JTL%"
if exist "%REPORT%" rmdir /s /q "%REPORT%"
if exist "%ZIP%" del "%ZIP%"

"%JMETER_BIN%" -n -t "%JMX%" -l "%JTL%" -e -o "%REPORT%"

if errorlevel 1 (
  echo La prueba fallo. Revisa que MiniShop este levantado en http://localhost:8080 y que JMETER_BIN sea correcto.
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -Path '%REPORT%\*' -DestinationPath '%ZIP%' -Force"

echo.
echo Listo:
echo - Resultados: %JTL%
echo - Reporte HTML: %REPORT%\index.html
echo - ZIP para entregar: %ZIP%

endlocal
