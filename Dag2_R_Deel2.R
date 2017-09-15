#### load required libraries ####
library(ggplot2)
library(dplyr)


#### load data ####
df <- read.csv("Metadata.csv")

gemiddelde <- mean(df[df$Reactor.phase == "Control", "ph"])    #Bereken gemiddelde van df => selectie => kolom;ph en row;control
gemiddelde

levels(df$Reactor.phase)
### NUT VAN DPLYR => om gemakkelijk van een grot dataset over te gaan naar simpele, kleine, makkelijk te gebruiken dataset

#### Select ####

physicochem <- select(df,ph,temp,Conductivity)
head(physicochem)

#ctrl + shift + m   => PIPE => ipv. verschillende variabelen te maken, om aan ehtzelfde eindresultaat te komen 
physicochem <- df %>% select(ph,temp,Conductivity)
head(physicochem)

physicochem.control <- df %>%
  filter(Reactor.phase == "Control") %>% 
  select(ph,temp,Conductivity)

#### Challenge ####
#select only the Diversity parameters, for the reactor startup

Challenge <- df %>% 
  filter(Reactor.phase == "Startup") %>% 
  select(Diversity...D0,Diversity...D1,Diversity...D2)

### FOUT => check je gemaakte matrices
Challenge <- df %>% 
  select(Diversity...D0,Diversity...D1,Diversity...D2) %>% 
  filter(Reactor.phase == "Startup")

#### Group and summarise ####

### Group by 
meanph <- df %>%  group_by(Reactor.phase) %>% 
  summarise(mean.ph = mean(ph),
            mean.d2 = mean(Diversity...D2),
            sdph = sd(ph))
meanph

#### Challenge ####
# Generate a summary for reactor phase 2 and the sd of d2 and the log10 transformed cell count

reactorphase2 <- df %>% filter(Reactor.cycle == 2)
            summarise(stand.dev = sd(Diversity...D2),
            mean.log.tcc = mean(log10(Cell.density..cells.mL.)))
reactorphase2

#### mutate #### =>>> FOUT 
Temp <- mutate(condratio=df$Conductivity/T) %>% 
            summarise(stand.dev = sd(Diversity...D2),
            mean.log.tcc = mean(log10(Cell.density..cells.mL.)))
Temp

#### Join data sets ####
physicochem <- df %>% 
  select(sample_title,temp,ph,Conductivity)
diversity <- df %>% 
  select(sample_title,contains("Diversity"))

# combine dplyr ans ggplot
physicodiversiy <- dplyr::full_join(physicochem, diversity ,by="sample_title")
View(physicodiversiy)

df.nona <- na.exclude(df)
rowSums(is.na(df))
