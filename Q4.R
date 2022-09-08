##########���� �� ���########

getwd()

setwd("D://HW2")

install.packages('ggplot2')


#############���� �ҷ�����##########
library(readxl)
HW2_Data2 <- read_excel("HW2_Data2.xlsx")
View(HW2_Data2)

library(readr)
HW2_Data1 <- readr::read_tsv("HW2_Data1.tsv")
View(HW2_Data1)

###������ ���� ��, �� �߰�#####
data2<-HW2_Data1
data<-HW2_Data2
head(data)
summary(data)

str(data)
head(data)
model_1<-lm(ProfWeight_Kg ~ StudentExcercise, data = data)
summary(model_1)

#################### �׷���#######################
library(ggplot2)
ggplot(data = data,aes(x=Date))+geom_line(data = data,aes(y=ProfWeight_Kg))

library(ggplot2)
ggplot(data = data,aes(x=Date))+geom_line(data = data,aes(y=StudentWeight_Kg))


#################���� �Լ� ����ϱ�###############

newdata<-data.frame(X=c(1,2,3,4))
predict(model_1,newdata = newdata,interval = "confidence")