# 2020/04/29 Keonwoopark

# 데이터 가져오기(read.table)
worldtxt <- read.table("world_tem.txt",
                       header = T,
                       sep="\t",
                       stringsAsFactor = FALSE,
                       na.strings="."
)
str(worldtxt)

Extraction <- function(a){
  mean_temp <-c()
  for(j in 1:12){
    temp_sum = 0
    count = 0
    for (i in 1:length(worldtxt[,1])){
      if(as.numeric(substr(worldtxt$X3[i],6,7)) %in% j & (worldtxt$X2[i] == a)){
        temp_sum = temp_sum + worldtxt$X4[i]
        count = count+1
      }
    }
    n_value = round(temp_sum/count,digits = 1)
    mean_temp<-c(mean_temp,n_value)
    
  }
  return(mean_temp)
}

install.packages("reshape")
library(reshape)
world_temp <-data.frame(world_temp, Extraction("브라질리아"))

world_temp$Extraction..파리..
world_temp
world_temp <- rename(world_temp, 
                   c(Extraction..브라질리아.. = "브라질"))
world_temp
t_world_temp=t(world_temp)
t_world_temp

write.csv(world_temp,
          file = "world_temp4.csv",
          row.names = F,
          na = "")


