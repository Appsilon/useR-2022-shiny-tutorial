Inicializando renv
================

La idea de este proyecto es familiarizarse con el uso de `renv` para
**registrar dependencias** de nuestro proyecto (app) a medida que lo
vamos desarrollando.

Para esto sigamos estos pasos:

## 1. Instalar `renv`

``` r
install.packages("renv")
```

## 2. Inicializar `renv`

``` r
renv::init()
```

`renv` setea el andamiaje para funcionar en el proyecto:

-   Crea `renv.lock`, el archivo de registro de dependencias (y sus
    versiones).
-   Crea `.Rprofile` si no existia, para activarse cada vez que se
    iniciar el proyecto.
-   Crea la carpeta `renv/` con el archivo de configuracion
    `settings.dcf` y la library con los paquetes registrados en
    `renv.lock`.

## 3. Usar `renv`

Imaginemos que en nuestra app queremos agregar un grafico, y que para
eso vamos a usar `ggplot2::ggplot`, por ej:

``` r
  output$phonePlot <- renderPlot({
    data <- data.frame(x = rownames(WorldPhones),
                       y = WorldPhones[, input$region]*1000)
    ggplot(data, aes(x, y)) +
      geom_col() +
      labs(x = "Año", 
           y = "Cantidad de Telefonos",
           title = input$region)
  })
```

Copiemos este codigo en nuestra funcion `server` en el archivo `app.R`,
e intentemos correr nuestra app. Que pasa? Funciona?

***NO :(***

Y esto por que sucede? Porque estamos agregando una dependencia en
nuestro codigo (`ggplot2`) que no tenemos instalada aun. Resolvamos esto
corriendo en la consola:

``` r
install.packages("ggplot2")
library(ggplot2)
```

Ahora si va a funcionar, pero… que pasa si yo le mando mi `app.R` a otra
persona, y ellos no tienen instalado `ggplot2`?

No les va a funcionar! Igual que a nosotros antes, mas alla de que a
nosotros ahora **SI** nos funciona (y esto tambien puede pasarnos a
nosotros mismos si, por ej, perdemos los paquetes instalados)

***Solucion***: registrar los paquetes necesarios para nuestro proyecto
usando `renv`!

`snapshot` captura los paquetes que estan siendo usados en nuestro
proyecto. Probemos entonces:

``` r
renv::snapshot()
```

Hizo algo? Mmm, si bien nosotros tenemos disponible `ggplot2` en nuestra
sesion, `renv` no lo ve en el proyecto…porque nunca lo declaramos en el
codigo (solo corrimos `library(ggplot2)` en la consola).

Agreguemos `library(ggplot2)` debajo de `library(shiny)` y corramos

``` r
renv::snapshot()
```

Ahora si! `renv` ahora va a registrar todas las dependencias en
`renv.lock` (si quieren pueden mirar el archivo `lock` para ver como es
el registro de cada paquete, que informacion guarda, etc).

Ya estamos en condiciones de compartir nuestro codigo con otros, siempre
y cuando compartamos tambien nuestro `renv.lock`!
