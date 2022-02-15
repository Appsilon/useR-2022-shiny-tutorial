Para poder correr los proyectos `2_config`, `3_testthat-covr` y `4_lintr-styler` **localmente**, recorda hacer 
``` {r}
renv::restore()
```
***antes*** de empezar a trabajar (correr la app, etc).

De este modo, nos aseguramos de tener disponibles en nuestra *library* todas las dependencias necesarias (registradas en `renv.lock` de cada proyecto).
