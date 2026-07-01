# README rapido - Laboratorio 15 JMeter

## Ya avanzado

- Plan JMeter: `docs/load-tests/minishop-load-test.jmx`
- Plantilla de evidencias: `docs/load-tests/evidencias-lab15-jmeter.md`
- Script Windows: `docs/load-tests/ejecutar-jmeter-windows.bat`

## Lo que debes hacer ahora

1. Abre CMD en la carpeta del proyecto:

```text
C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main
```

2. Levanta MiniShop:

```bash
mvn spring-boot:run
```

3. Verifica que responda:

```bash
curl http://localhost:8080/api/products
```

4. En otra ventana CMD, ejecuta el sembrado de productos:

```bat
"C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\sembrar-productos-windows.bat"
```

5. Abre JMeter y carga:

```text
C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\minishop-load-test.jmx
```

6. Este proyecto usa `/api/products`, por eso el JMX ya esta ajustado a esa ruta.

7. Ejecuta en interfaz grafica y toma captura del `Aggregate Report`.

8. Para generar reporte HTML y ZIP:

- Edita `JMETER_BIN` dentro de `ejecutar-jmeter-windows.bat` si tu JMeter esta en otra ruta.
- Ejecuta el `.bat`.
- Abre `docs/load-tests/reporte-html/index.html`.
- Entrega `docs/load-tests/reporte-html.zip`.

## Numeros que debes copiar a la plantilla

Desde `Aggregate Report` o `Dashboard / Statistics`:

- `# Samples`
- `Average`
- `90% Line`
- `95% Line`
- `Error %`
- `Throughput`

## Frase rapida para el cuello de botella

Si los tiempos suben y no hay muchos errores:

> El posible cuello de botella se encuentra en el acceso a datos o en el pool de conexiones, ya que bajo concurrencia el tiempo p95 aumenta mientras el sistema sigue respondiendo. Se recomienda revisar consultas, indices y configuracion de HikariCP.

Si hay errores:

> El posible cuello de botella se evidencia por el incremento de errores durante el ramp-up. Esto indica que la aplicacion no esta soportando la concurrencia configurada, posiblemente por saturacion de conexiones, recursos del servidor o validaciones del endpoint.
