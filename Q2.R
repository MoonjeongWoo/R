#거리행렬 구하기
data_scaled<-scale(data)
d<-dist(data_scaled)
as.matrix(d)[1:21,]

#거리행렬 모델 적용(계층적 군집화)
fit<-hclust(d,method="average")
plot(fit,hang = -1,cex=0.8,xlab="",ylab="")

#군집 수 설정
install.packages("NbClust")
library(NbClust)
nc<-NbClust(data_scaled,distance="euclidean",min.nc = 2,max.nc=15,method="average", index = "all")

clusters <- cutree(fit, k=)
table(clusters) 

#시각화
plot(fit, hang= -1, cex=0.8)
rect.hclust(fit, k=)