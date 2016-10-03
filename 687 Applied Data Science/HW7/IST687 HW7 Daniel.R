#IST 687  HW 7
# Daniel Fernandes


# copying mtcars dataset to local vector
mycars <- mtcars

# installing ggplot libraries
install.packages("ggplot2")
library(ggplot2)

#1  creating histogram 
ggplot(data = mycars, aes(x= mpg)) + geom_histogram(binwidth = 1, color= "black", fill= "blue" )

#2 creating boxplot
ggplot(data = mycars) + geom_boxplot(stat = "boxplot" , outlier.colour = "blue", aes(x=factor(cyl), y= mpg )) +
            labs(x= "cylinders")


#3 creating Multiline
ggplot(mycars, aes(x = wt , y = mpg, group = factor(am), color = factor(am)))  +
         geom_line() + geom_point() + labs(color= "am")


#4 creating bar chart
g <- ggplot(mycars ,aes(x=row.names(mycars), y=wt)) + geom_bar(stat="identity")
g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(x= "car names")
g


#5 creating Scatter
scatplot <- ggplot(mycars , aes(x= mpg, y= wt)) + geom_point(aes(size = qsec , color = qsec))
scatplot


#6 creating heatmap
library(reshape2)
mynewcars <- data.frame(mycars$wt, mycars$cyl, mycars$mpg)

melteddata <- melt(mynewcars , id= c("mycars.wt","mycars.cyl"))
heatplot <- ggplot(melteddata, aes(x=factor(melteddata$mycars.wt) , y = melteddata$mycars.cyl))
heatmap <- heatplot + geom_tile(aes(fill=melteddata$value)) + scale_fill_gradient(low="white", high="blue" ) +
         theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
          labs(x= "weight", y="cylinders", fill = "mpg")
heatmap


