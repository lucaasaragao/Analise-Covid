# Removendo as nota��es cientificas dos valores
options(scipen = 999)

# Instalando algumas bibliotecas importantes
pkgs <- c("tidyverse", "geofacet", "here", "patchwork", "scales", "zoo", "outliers")
install.packages(pkgs, dependencies = TRUE)

# Carregando algumas bibliotecas importantes
library(tidyverse) # conjunto de pacotes que sempre iremos usar
library(geofacet) # organiza plots de acordo com regi�o
library(here) # acesso a arquivos relativos � partir da ra�z do projeto
library(lubridate) # manipula��o de datas (tidyverse)
library(patchwork) # organiza o layout dos plots
library(readxl) # carrega arquivos excel (tidyverse)
library(scales) # fun��es �teis para lidar com escalas de gr�ficos
library(zoo) # fun��o de m�dia m�vel (rolling average)
library(outliers) # fun��o para melhorar a detec��o de outliers



# Vamos carregar os dados disponibilizados
dados_app <- read.csv(here( "Aulas/lab1-Adson",  "aplicativo_controle_financeiro.csv"))
glimpse(dados_app)

# Olhando as primeiras linhas
head(dados_app)


##Qual a m�dia, m�dia aparada excluindo 10% dos valores extremos e a mediana das horas logadas no aplicativo? 
  
  
## M�dia
media_horas_logado <- mean(dados_app[["horas_logado"]])
media_horas_logado


## M�dia aparada retirando os valores extremos (outliers)
media_horas_sem_valores_extremos <- mean(dados_app[["horas_logado"]], trim = 0.1)
media_horas_sem_valores_extremos

## M�diana das horas logadas no aplicativo
mediana_horas_logado <- median(dados_app[["horas_logado"]])
mediana_horas_logado

## Respostas
## a. Por que a mediana � menor do que a m�dia? 
##  R -  O dataframe cont�m valores "extremos" que aumentam o valor da m�dia ou seja puxam a m�dia pra cima. A mediana j� � menos afetada por esses valores "extremos".

## b. Por que a mediana � mais pr�xima da m�dia aparada?
##  R -  Pela m�dia ponderada desconsiderar os valores "extremos" ela se aproxima bem mais do valos da mediana do que da m�dia.


