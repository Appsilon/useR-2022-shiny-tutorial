Usando lintr y styler
================

## `lintr` para inspeccionar nuestro codigo

Imaginemos que hacemos unos cambios a `app.R` como los que estan ahora.
Es obvio que hay algunos problemas de legibilidad. En vez de
inspeccionar linea por linea nosotros mismos, podemos usar `lintr`!

Por default, `lintr` verifica si el codigo cumple con varias “normas”.
Para verlas:

``` r
names(lintr::default_linters)
```

Veamos entonces que nos dice `lintr` de nuestro codigo.

Tenemos 2 opciones:

-   correr por archivo `lintr::lint()`
-   correr por carpeta `lintr::lint_dir()`

Esto puede ser util si queremos aplicar las mismas o distintas reglas
entre distintas partes de nuestra app (distintos scripts, carpetas,
etc).

Probemos entonces mirando que nos dice sobre `app.R` corriendo

``` r
lintr::lint("app.R")
```

Por que detecto un problema con `NombreFeo` pero no con
`QuieroEsteNombreAsi`?

Miremos que pasa con el codigo en `utils.R`:

``` r
lintr::lint("utils.R")
```

## Emprolijando el codigo con `styler`

Una manera de corregir rapido algunos problemas que senala `lintr` es
usar `styler`.

Similar a como usamos `lintr` aca tambien podemos

correr por archivo `styler::style_file()` - correr por carpeta
`styler::style_dir()`

Probemos con

``` r
styler::style_file("app.R")
```
