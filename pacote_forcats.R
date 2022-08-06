
# Pacote forcats ---------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 05/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://forcats.tidyverse.org/ -----------------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### R usa fatores para manusear variáveis categóricas, variáveis que tem
### um fixado e conhecido conjunto de possíveis valores. Fatores também
### são úteis para reordenar fatores de caracteres para melhorar visualização.
### O objetivo do pacote forcats é promover um adequado conjunto de 
### ferramentas que resolve problemas comuns com fatores, incluindo
### mudar a ordem dos níveis dos fatores. Alguns exemplos incluem:

# - fct_reorder(): Reordenar um fator por uma outra variável.Reordering a factor by another variable.
# - fct_infreq(): Reordenar um fator pela frequência dos valores. Reordering a factor by the frequency of values.
# - fct_relevel(): Alterar a ordem de um fator à mão.
# - fct_lump(): Colapso dos valores menos/mais frequentes de um factor em "outro". 

# Instalação do pacote ---------------------------------------------------------------------------------------------------------------------

### O caminho mais fácil para instalar o pacote forcats é através da 
### instalação do tidyverse que apresenta um conjunto de pacotes necessários
### para manipulação de dados.

install.packages("tidyverse")

### Alternativamente, você pode apenas instalar o forcats.

install.packages("forcats")

### Ou através da versão disponível no GitHub

# install.packages("devtools")
devtools::install_github("tidyverse/forcats")

# Cheatsheet -------------------------------------------------------------------------------------------------------------------------------

### Você pode acessar o folheto com todas as funções do pacote forcats
### e com exemplos de aplicações.

# Na aba do R clique em 'Help' > Cheat sheets > Browse Cheat sheets

### Após isso, busque o cheat sheet relacioando ao pacote forcats

# Prática com o pacote ---------------------------------------------------------------------------------------------------------------------

### O pacote forcats é parte do coração do tidyverse, então você pode
### carregar o pacote através de

library(tidyverse) 
# ou 
library(forcats)

### Pacotes necessários

library(forcats)
library(dplyr)
library(ggplot2)

### Manipulação dos dados

starwars %>% 
  filter(!is.na(species)) %>% # Retirar os NAs da variável 'species'
  count(species, sort = TRUE) # Ordenar os valores do maior para o menor

starwars %>%
  filter(!is.na(species)) %>%
  mutate(species = fct_lump(species, n = 3)) %>%
  count(species)

### Gráficos

ggplot(starwars, aes(x = eye_color)) + 
  geom_bar() + 
  coord_flip()

starwars %>%
  mutate(eye_color = fct_infreq(eye_color)) %>%
  ggplot(aes(x = eye_color)) + 
  geom_bar() + 
  coord_flip()
