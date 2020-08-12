# Removendo as notações cientificas dos valores
options(scipen = 999)

# Instalando algumas bibliotecas importantes
pkgs <- c("tidyverse", "geofacet", "here", "patchwork", "scales", "zoo", "outliers")
install.packages(pkgs, dependencies = TRUE)

# Carregando algumas bibliotecas importantes
library(tidyverse) # conjunto de pacotes que sempre iremos usar
library(geofacet) # organiza plots de acordo com região
library(here) # acesso a arquivos relativos à partir da raíz do projeto
library(lubridate) # manipulação de datas (tidyverse)
library(patchwork) # organiza o layout dos plots
library(readxl) # carrega arquivos excel (tidyverse)
library(scales) # funções úteis para lidar com escalas de gráficos
library(zoo) # função de média móvel (rolling average)
library(outliers) # função para melhorar a detecção de outliers



# Vamos carregar os dados disponibilizados
dados_app <- read.csv(here( "Aulas/lab1-Adson",  "aplicativo_controle_financeiro.csv"))
glimpse(dados_app)

# Olhando as primeiras linhas
head(dados_app)


##Qual a média, média aparada excluindo 10% dos valores extremos e a mediana das horas logadas no aplicativo? 
  
  
## Média
media_horas_logado <- mean(dados_app[["horas_logado"]])
media_horas_logado


## Média aparada retirando os valores extremos (outliers)
media_horas_sem_valores_extremos <- mean(dados_app[["horas_logado"]], trim = 0.1)
media_horas_sem_valores_extremos

## Médiana das horas logadas no aplicativo
mediana_horas_logado <- median(dados_app[["horas_logado"]])
mediana_horas_logado

## Respostas
## a. Por que a mediana é menor do que a média? 
##  R -  O dataframe contém valores "extremos" que aumentam o valor da média ou seja puxam a média pra cima. A mediana já é menos afetada por esses valores "extremos".

## b. Por que a mediana é mais próxima da média aparada?
##  R -  Pela média ponderada desconsiderar os valores "extremos" ela se aproxima bem mais do valos da mediana do que da média.


