Config
================

`config` nos permite

-   administrar en un solo lugar todas los valores “constantes” de
    nuestras apps
    -   preferencias (argumentos de funciones)
    -   conexiones a DBs
    -   numeros “magicos”
    -   colores
    -   etc
-   crear perfiles de constantes
    -   dev
    -   test
    -   prod
    -   etc

Para esto, usa un archivo `config.yaml` (el formato YAML tiene una
funcion similar a JSON), donde se pueden definir las constantes
jerarquicamente.

Para usar `config` en nuestra app:

### 0. Determinar que perfil usaremos en la app.

Hay varias opciones, pero todas redundan en lo mismo: cambiar el valor
de la variable `R_CONFIG_ACTIVE` (que es la que `config` lee por default
para entender que perfil leer).

Entonces, se puede correr en consola, o agregar a `.Rprofile`

``` r
Sys.setenv(R_CONFIG_ACTIVE = "<perfil>")
```

o

``` r
file.create(".Renviron")
```

y agregar `R_CONFIG_ACTIVE="<perfil>"` en ese archivo.

Si solo tenemos **un** perfil (default), entonces **no hace falta
declarar `R_CONFIG_ACTIVE`**.

### 1. Llamar a `get` para leer el archivo `config.yaml`

``` r
constants <- config::get(file = "constants/config.yml")
```

### 2. Usar las constantes en la app.

Cuidado! `config` es “silencioso”. Es decir, si no encuentra una
variable o el nombre del perfil no existe, no va a mostrar ni error ni
warning.

Para poner “a prueba” lo que aprendimos podemos intentar responder las
preguntas en `preguntas_config.R`
