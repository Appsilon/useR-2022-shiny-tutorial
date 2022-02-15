Usando renv
================

## Sincronizando nuestra library

Ahora imaginemos que estamos desarrollando un proyecto con un colega, y
nos hace llegar una version de nuestra app con algunos cambios. Prefiere
usar [`shiny.semantic`](https://github.com/Appsilon/shiny.semantic) para
el layout de la aplicacion y tambien quiere cambiar el `selectInput` de
`shiny` a `dropdown_input`, tambien de `shiny.semantic` . Importante:
nuestro colega sabe usar `renv` e hizo un `snapshot` antes de compartir
el codigo.

Si corremos la app, vamos a ver que no va a funcionar.

Para entender por que pasa, podemos ver el estado de sincronizacion de
nuestra library con `renv.lock` corriendo:

``` r
renv::status()
```

Siempre es util chequear esto *antes* de empezar a trabajar sobre
nuestro codigo.

Vemos entonces que la app no funciona porque hay una dependencia
registrada en `renv.lock` que no tenemos instalada: `shiny.semantic`.

Para sincronizar nuestra library con `renv.lock`, usamos
**`renv::restore()`**:

``` r
renv::restore()
```

Si volvemos a correr la app, ahora si va a funcionar.

`restore` tiene dos usos principales:

-   sincronizar `renv.lock` con nuestra library cuando, por ej, hacemos
    pull de una branch de un colega.
-   volver al estado del ultimo snapshot de nuestra library (como una
    mini maquina del tiempo)

## Registrando dependencias

Los `snapshots` en `renv` son `implicit` por default. Es decir, `renv`
va a buscar los paquetes que estan siendo usados en nuestro proyecto,
mirando todos los archivos `.R`.

Como nuestro ejemplo solo tiene un script, esto va a funcionar bien y
rapido, pero cuando empezamos a agregar mas scripts (para preprocesar
datos, modulos, etc) esto puede ser lento y a veces `renv` puede no
detectar alguna dependencia.

Para resolver esto, poremos cambiar el modo de `snapshot` a `explicit`,
pero esto implicaria tener un archivo `DESCRIPTION` (y en gral, a menos
que estemos desarrollando la app como un paquete, no vamos a tener este
archivo). Ademas, esto genera problemas al hacer deployment de nuestra
app.

**Solucion**:

1.  Crear un archivo `.renvignore`

``` r
file.create(".renvignore")
```

2.  Escribir en el archivo:

<!-- -->

    *
    !dependencies.R

Esto lo que significa, es que `renv` **SOLO** va a detectar las
dependencias en un archivo que vamos a llamar `dependencies.R`,
ignorando todo el resto.

3.  Crear un archivo `dependencies.R`

``` r
file.create("dependencies.R")
```

4.  Agregar en este archivo los paquetes que se usan en nuestro
    proyecto:

``` r
library(shiny)
library(ggplot2)
library(shiny.semantic)
```

Asi, cada vez que querramos registrar una nueva dependencia con
`snapshot` tenemos que incluir un llamado a `library(<nuevo paquete>)`
en `dependencies.R`.

5.  Probemos esta logica incluyendo el paquete `dplyr` y llamando a
    `renv::snapshot()`

Veremos que ahora inlcuimos `dplyr` en `renv.lock` (mas alla de que no
lo estemos usando en el proyecto aun).
