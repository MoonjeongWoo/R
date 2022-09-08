getwd()
setwd("D://HW2")

data<-read.table("HW2_Data1.tsv", sep = "\t")
str(data)

dt<-read.table("HW2_Data1.tsv", sep = "\t")
sampleName<-dt[-1,1]

#character ê°? ? œê±? ?›„ numeric?œ¼ë¡? ë³€?™˜
data<-(data[-1,-1])
data<-as.matrix(sapply(data,as.numeric))

#ì£¼ì„±ë¶„ë¶„?„
pca_data<-prcomp(data,scale=TRUE)
pca_data
summary(pca_data)

#ê²°ê³¼ ?‹œê°í™”
plot(pca_data,main="",type="lines",pch=1,npcs=length(pca_data$sdev))
plot(pca_data$x[,1],pca_data$x[,2])

dt1 <- predict(pca_data)[, 1] 
dt2 <- predict(pca_data)[, 2] 
par(mfrow = c(1,2)) 
plot(pca_data$sdev, dt1, xlab="", ylab="", pch = 16, main="PC 1", col = "red") 
plot(pca_data$sdev, dt2, xlab="", ylab="", pch = 16, main="PC 2", col = "blue")


#sampleNameë³? ?‹œê°í™”
df_pca_data=data.frame(PC1 = pca_data$x[,1], PC2 = pca_data$x[,2], sampleName, sample = data)

library(ggplot2)
pca.data=data.frame(X=pca_data$x[,1],Y=pca_data$x[,2])
pca.data<-cbind.data.frame(pca.data,species=df_pca_data$sampleName)

ggplot(data = pca.data)+geom_point(aes(x=X,y=Y,col=sampleName))+theme_bw()+xlab('PC1')+ylab('PC2')

