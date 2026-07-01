@echo off
setlocal

set BASE_URL=http://localhost:8080/api/products

echo Creando productos de prueba en %BASE_URL% ...

curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Laptop Lenovo\",\"price\":2500.00,\"stock\":10}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Mouse Logitech\",\"price\":80.00,\"stock\":40}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Teclado Mecanico\",\"price\":180.00,\"stock\":25}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Monitor 24\",\"price\":650.00,\"stock\":12}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Audifonos\",\"price\":120.00,\"stock\":30}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Webcam HD\",\"price\":160.00,\"stock\":18}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Disco SSD 1TB\",\"price\":320.00,\"stock\":16}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Memoria RAM 16GB\",\"price\":210.00,\"stock\":20}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Router WiFi\",\"price\":190.00,\"stock\":14}"
curl -s -X POST "%BASE_URL%" -H "Content-Type: application/json" -d "{\"name\":\"Silla Ergonomica\",\"price\":480.00,\"stock\":8}"

echo.
echo Verificando lista:
curl "%BASE_URL%"

echo.
echo Listo. Ahora ejecuta JMeter.

endlocal
