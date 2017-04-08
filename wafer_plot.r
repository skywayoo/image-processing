library(ggplot2)
#設定坐標
x <- c(5,5,rep(6:9,each=4),10,10,3,3,rep(4:11,each=4),12,12,2,2, rep(3:12,each=4),13,13,2,2,rep(3:12,each=4),13,13,1,1,rep(2:13,each=4),14,14,1,1,rep(2:13,each=4),14,14,1,1,rep(2:13,each=4),14,14,1,1,rep(2:13,each=4),14,14,1,1,rep(2:13,each=4),14,14, 2,2, rep(3:12,each=4),13,13, 2,2, rep(3:12,each=4),13,13, 3,3,rep(4:11,each=4),12,12, 5,5,rep(6:9,each=4),10,10)
y1 <- c(1,2,2,1)
y <- c(rep(y1,5),rep(y1+1,9),rep(y1+2,11), rep(y1+3,11),rep(y1+4,13), rep(y1+5,13), rep(y1+6,13),rep(y1+7,13), rep(y1+8,13), rep(y1+9,11), rep(y1+10,11), rep(y1+11,9), rep(y1+12,5))

ids <- factor(c(1:137))
value <- data.frame(
        id = ids,
        value= c(rnorm(137,mean=2.5))
)
positions <- data.frame(id=rep(ids,each=4),x,y) 
datapoly <- merge(value,positions,by=c("id"))
p <- ggplot(datapoly, aes(x,y)) + geom_polygon(aes(fill=value, group=id),color = "black", size = 0.25) 
p
#設定顏色
p= p+scale_fill_gradient(low = "yellow", high = "blue")  
#去除xy軸..etc
p+theme_bw()+theme(panel.grid=element_blank(),panel.border=element_blank(),axis.ticks = element_blank(),
                   axis.line=element_blank(),axis.title = element_blank(),axis.text = element_blank(),
                   legend.position = "none")





#read jpg
library(imager)
img = load.image(file = "D:/使用者/skywayoo/Desktop/wwww.jpeg")
img
#Image. Width: 672 pix Height: 672 pix Depth: 1 Colour channels: 3 
plot(img)
