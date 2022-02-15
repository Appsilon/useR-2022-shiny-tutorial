# Que problemas tienen estas expresiones?

numero <- config::get(file = "constants/cnfig.yml",  value = "numero")

titulo <- config::get(file = "constants/config.yml",  value = "titlo")

valores <- config::get(file = "constants/config.yml")

# Por que no obtengo los valores del perfil "default"?
print(valores)

# Como puedo cambiar el perfil de constantes a "default"?
