##########저장 및 경로########

getwd()

setwd("D://HW2")

install.packages('ggplot2')


#############파일 불러오기##########
library(readxl)
HW2_Data2 <- read_excel("HW2_Data2.xlsx")
View(HW2_Data2)

library(readr)
HW2_Data1 <- readr::read_tsv("HW2_Data1.tsv")
View(HW2_Data1)

###데이터 선언 및, 모델 추가#####
data2<-HW2_Data1
data<-HW2_Data2
head(data)
summary(data)

str(data)
head(data)
model_1<-lm(ProfWeight_Kg ~ StudentExcercise, data = data)
summary(model_1)

#################### 그래프#######################
library(ggplot2)
ggplot(data = data,aes(x=Date))+geom_line(data = data,aes(y=ProfWeight_Kg))

library(ggplot2)
ggplot(data = data,aes(x=Date))+geom_line(data = data,aes(y=StudentWeight_Kg))


#################예측 함수 사용하기###############

newdata<-data.frame(X=c(1,2,3,4))
predict(model_1,newdata = newdata,interval = "confidence")
