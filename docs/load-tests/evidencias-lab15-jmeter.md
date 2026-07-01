# Laboratorio 15 - Pruebas de Carga con Apache JMeter

## Datos generales

- Curso: Construccion y Pruebas de Software
- Laboratorio: Semana 15 - Pruebas de Carga con Apache JMeter
- Proyecto evaluado: MiniShop
- URL base evaluada: `http://localhost:8080`
- Herramienta: Apache JMeter 5.6.x
- Fecha de ejecucion: [colocar fecha]

## Evidencia 1 - Plan de prueba JMeter

Archivo creado:

`C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\minishop-load-test.jmx`

Configuracion incluida:

| Thread Group | Endpoint | Usuarios | Ramp-up | Loops |
|---|---:|---:|---:|---:|
| TG-01: Consulta de Catalogo | `GET /api/products` | 100 | 30 s | 3 |
| TG-02: Consulta de Producto Individual | `GET /api/products/1` | 50 | 20 s | 5 |

Headers configurados:

| Name | Value |
|---|---|
| Accept | application/json |
| Content-Type | application/json |

Captura sugerida: JMeter mostrando el Test Plan con los dos Thread Groups.

## Evidencia 2 - Ejecucion de la prueba

Comando utilizado para levantar MiniShop:

```bash
mvn spring-boot:run
```

Verificacion de endpoint:

```bash
curl http://localhost:8080/api/products
```

Carga de datos de prueba:

```bat
"C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\sembrar-productos-windows.bat"
```

Captura requerida: Aggregate Report en JMeter con datos visibles.

## Evidencia 3 - Reporte HTML

Comando para generar el reporte en Windows:

```bat
jmeter.bat -n ^
-t C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\minishop-load-test.jmx ^
-l C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\resultados.jtl ^
-e ^
-o C:\Users\K4RY\Downloads\mini\minishop-pruebas-integracion-main\minishop-pruebas-integracion-main\docs\load-tests\reporte-html
```

Captura requerida: `reporte-html/index.html` abierto en el navegador, seccion Dashboard / Statistics.

## Tabla de metricas

Completar con los valores del Aggregate Report o del Dashboard HTML.

| Metrica | Criterio de aceptacion | Valor obtenido | Cumple |
|---|---:|---:|---|
| p90 `GET /api/products` | <= 500 ms | [X] ms | [Si/No] |
| p95 `GET /api/products` | <= 800 ms | [X] ms | [Si/No] |
| Error % `GET /api/products` | <= 1% | [X]% | [Si/No] |
| Throughput total | >= 30 req/s | [X] req/s | [Si/No] |

## Analisis por endpoint

### `GET /api/products`

El endpoint `GET /api/products` proceso [X] peticiones con un throughput de [Y] req/s. El p95 fue de [Z] ms, lo cual [cumple/no cumple] con el criterio de aceptacion de 800 ms. Se observo [comportamiento estable/aumento progresivo de tiempos/errores durante el ramp-up]. El posible cuello de botella identificado es [consulta a base de datos sin indice/falta de cache/pool de conexiones limitado]. La accion recomendada es [optimizar consulta/agregar cache/revisar configuracion de HikariCP].

### `GET /api/products/1`

El endpoint `GET /api/products/1` proceso [X] peticiones con un throughput de [Y] req/s. El p95 fue de [Z] ms, lo cual [cumple/no cumple] con el criterio de aceptacion definido para la prueba. Se observo [comportamiento]. El posible cuello de botella identificado es [hipotesis]. La accion recomendada es [accion].

## Cuello de botella identificado

El principal cuello de botella observado fue [endpoint o componente]. La evidencia es que [p95 alto/error % elevado/throughput cae/tiempos aumentan durante la carga]. Esto puede relacionarse con [pool de conexiones, consultas sin indice, falta de cache, consumo de CPU o bloqueo en operaciones de escritura]. Como mejora se propone [accion concreta].

## Preguntas de reflexion

1. Se recomienda usar el modo `-n` porque consume menos recursos que la interfaz grafica y permite obtener resultados mas confiables en pruebas reales. La interfaz grafica debe usarse principalmente para disenar y depurar el plan.

2. Si el p95 de `GET /api/products` fue de [X] ms, entonces el 5% de los usuarios experimento un tiempo de respuesta mayor a ese valor.

3. Si los usuarios concurrentes aumentaran de 100 a 500, probablemente fallaria primero [base de datos/pool de conexiones/CPU/memoria], porque [justificacion segun tus resultados].

4. HikariCP limita cuantas conexiones simultaneas puede usar la aplicacion hacia la base de datos. Si el pool es muy pequeno frente a la carga, las solicitudes esperan conexiones disponibles, suben los tiempos de respuesta y baja el throughput.

## Checklist de entrega

- [ ] `docs/load-tests/minishop-load-test.jmx` subido al repositorio.
- [ ] Captura del Aggregate Report en `.png` o `.jpg`.
- [ ] Carpeta `reporte-html` comprimida en `.zip`.
- [ ] Tabla de metricas completada.
- [ ] Analisis por endpoint y cuello de botella incluido.
