## PROJECT-1 ##

##  PART-1  ##
data1=read.delim("001.dat",header = F,sep=",",skip=9,as.is=T)
data2=read.delim("002.dat",header = F,sep=",",skip=9,as.is=T)
data3=read.delim("003.dat",header = F,sep=",",skip=9,as.is=T)
data4=read.delim("004.dat",header = F,sep=",",skip=9,as.is=T)
data5=read.delim("005.dat",header = F,sep=",",skip=9,as.is=T)
data6=read.delim("006.dat",header = F,sep=",",skip=9,as.is=T)
data7=read.delim("007.dat",header = F,sep=",",skip=9,as.is=T)
data8=read.delim("008.dat",header = F,sep=",",skip=9,as.is=T)
data9=read.delim("009.dat",header = F,sep=",",skip=9,as.is=T)
data10=read.delim("010.dat",header = F,sep=",",skip=9,as.is=T)
data_num=rbind(data2,data4,data6,data8,data10)
data_char=rbind(data1,data3,data5,data7,data9)
for(i in c("V1","V2","V3","V4"))
{
  data_char[,i]=as.numeric(data_char[,i])
}
full_data=rbind(data_num,data_char)
colnames(full_data)=c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

##  PART-2  ##
install.packages("XML")
library(XML)
library("methods")
df<- xmlToDataFrame("iris.xml",stringsAsFactors = F)
print(df)
df1=df
df1$Flower=c("Flower1","Flower2","Flower3")
print(df1)

##  PART-3  ##
install.packages("jsonlite")
library("jsonlite")
a=xmlToList("iris.xml")
x=toJSON(iris)
result <- fromJSON(x)
iris_data=as.data.frame(result)
print(iris_data)

##  PART-4  ##
library("dplyr")
View(iris_data)
irisdata_dplyr=iris_data %>%
  select(Species,contains("Petal"),contains("Sepal")) %>%
  rename(Petal_Length=Petal.Length,Sepal_Length=Sepal.Length) %>%
  filter(Petal_Length>4 & Petal.Width<1.9 ) %>%
  mutate(Petal_Area=(Petal_Length*Petal.Width),Sepal_Area=(Sepal_Length*Sepal.Width)) %>%
  arrange(Petal_Area)

## PART-5  ##
summary(iris_data)
summary(irisdata_dplyr)
