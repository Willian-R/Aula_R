##ajustar local de trabalho
getwd()
setwd("C:/Users/Casa/Documents/minicurso")

##importar dados
install.packages("datasets")
require(datasets)
library(datasets)

?infert
dados <- infert
str(dados)
names(dados)
dim(dados)

##partição dos meus dados
##70 % treino, 30% teste
particionar <- sample(2, nrow(dados), replace = TRUE, prob = c(0.7, 0.3))
treino <- dados[particionar==1,]
teste <- dados[particionar==2,]

## rede neural artificial
install.packages("neuralnet")
library(neuralnet)

rede <- neuralnet(case~age+parity+spontaneous+induced,
                  hidden = 5,
                  data = treino,
                  rep = 4,
                  err.fct = "ce", ##ce = cross-entropy (classificação); sse = soma do erro quadrado (regressão)
                  lifesign = "minimal",
                  linear.output = FALSE,
                  stepmax = 1e6)

plot(rede, rep = 2)
