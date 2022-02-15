library(microbenchmark)
library(data.table)
library(fst)
library(vroom)
library(feather)
library(ggplot2)

leer_csv <- function() read.csv("datos/energia_mundial.csv", header = TRUE)
leer_data.table <- function() fread("datos/energia_mundial.csv")
leer_vroom <- function() vroom("datos/energia_mundial.csv")
leer_feather <- function() feather("datos/energia_mundial.feather") 
leer_fst <- function() fst("datos/energia_mundial.fst")
leer_rds <- function() readRDS("datos/energia_mundial.RDS")

resultados_benchmark <- microbenchmark(
  leer_csv(),
  leer_data.table(),
  leer_vroom(),
  leer_feather(),
  leer_fst(),
  leer_rds(),
  times = 5
)

autoplot(resultados_benchmark)

