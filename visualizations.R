library(tidyverse)

df <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_olympics.csv", 
               header=TRUE, 
               encoding="UTF-8")

table_prov_gender <- df %>% group_by(Province, Gender) %>% 
  summarize(`Average Sentiment` = mean(Sentiment)) 

table_prov_gender %>% mutate(Gender=factor(Gender)) %>% 
  ggplot(aes(x=Province, y=`Average Sentiment`, fill=Gender)) + 
  geom_bar(position="stack", stat="identity") + 
  coord_flip()
