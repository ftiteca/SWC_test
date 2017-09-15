df <- read.csv("Metadata.csv")

#which varaibles? 
str(df)     #info over alle variabelen die in de df/data frame zitten. 

# start plotting
library("ggplot2")

# Make first plot 
ggplot(data = df, aes(x = Timepoint, y =ph, fill=Reactor.cycle ))+    #+; niet vergeten!!! #Reactor cycle
geom_point(shape=21)

# change the reactor.cycle to a factor variable
ggplot(data = df, aes(x = Timepoint, y =ph, fill=Reactor.cycle ))+    #+; niet vergeten!!! #Reactor cycle
geom_point(shape=21,size=4)
ggplot(data=df,aes(x=Timepoint,y=ph))+
geom_point(shape=21,size=4)

df$Reactor.cycle <- factor(df$Reactro.cycle)
class(df$Reactor$cycle)

# Store ggplot object
p1 <- ggplot(data=df,aes(x=Timepoint,y=ph,fill=Reactor.cycle)) 
p1 <- p1 + geom_point(shape=21,size=4,alpha=.5)
p2 <- p1 +  theme_bw() + geom_line()

# facetting (really powerful!)
p3 <- p2 + facet_grid(~Reactor.cycle)
p3 <- p2 + facet_grid(~Reactor.cycle)
p3

#How do i know whats in die reactor phase
df$Reactor.phase
levels(df$Reactor.phase)    #enkel de verschillende types

p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)
p4

# kleur per reactorcycle ipv. reactortype
#optie1 
p1 <- ggplot(data=df,aes(x=Timepoint,y=ph,fill=Reactor.phase)) 
p1 <- p1 + geom_point(shape=21,size=4,alpha=.5)
p2 <- p1 +  theme_bw() + geom_line()

# facetting (really powerful!)
p3 <- p2 + facet_grid(~Reactor.cycle)
p3 <- p2 + facet_grid(~Reactor.cycle)
p3

#How do i know whats in die reactor phase
df$Reactor.phase
levels(df$Reactor.phase)    #enkel de verschillende types

p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)
p4

#optie2 
p5 <- p4 + geom_line(aes(color = Reactor.phase))
p5

#### challenge ####
#1: Diversity D0
g1 <- ggplot(data=df,aes(x=Diversity...D0,y=Diversity...D1,fill=Reactor.phase)) 
g1 <- g1 + geom_point(shape=21,size=4,alpha=.5)
g1

#2. Cell density
