library(tidyverse)

# read all data sets
olympics <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_olympics.csv", 
               header=TRUE, 
               encoding="UTF-8")
diaoyu <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_diaoyu.csv", 
                     header=TRUE, 
                     encoding="UTF-8")
gtypes <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_gtypes.csv", 
                     header=TRUE, 
                     encoding="UTF-8")
success <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_success.csv", 
                     header=TRUE, 
                     encoding="UTF-8")
government <- read.csv("C:\\Users\\hobbs\\OneDrive - Pomona College\\Y3\\RAISE\\weibo_corpus\\topic_data\\lwc_government.csv", 
                     header=TRUE, 
                     encoding="UTF-8")

# mutate Topic column for each data set and join into one data set (df)
olympics <- olympics %>% mutate(Topic="Olympics")
diaoyu <- diaoyu %>% mutate(Topic="Diaoyu")
gtypes <- gtypes %>% mutate(Topic="Gender Types")
success <- success %>% mutate(Topic="Success")
government <- government %>% mutate(Topic="Government")

df <- do.call("rbind", list(olympics, diaoyu, gtypes, success, government))

# save visualization
topic_avg <- df %>% mutate(Gender=factor(Gender)) %>% 
  group_by(Province, Gender, Topic) %>% 
  summarize(`Average Sentiment` = mean(Sentiment)) %>% 
  ggplot(aes(x=Topic, y=`Average Sentiment`, fill=Gender)) + 
  geom_bar(position="stack", stat="identity") + 
  coord_flip() + 
  facet_wrap(~Province) + 
  ggtitle("Average Sentiment by Topic") +
  theme(text = element_text(size=40), 
        axis.title=element_text(size=50),
        axis.text=element_text(size=30), 
        plot.title = element_text(size=60, hjust = 0.5), 
        legend.title = element_text(size = 50),
        legend.text = element_text(size = 50), 
        legend.margin = margin(0.2, 0.2, 0.2, 0.2, "cm"), 
        panel.spacing.x = unit(12, "mm"), 
        panel.spacing.y = unit(2, "mm")) + 
  scale_fill_discrete(labels = c("Female", "Male")) + 
  labs(caption="Note: Sentiment ranges from 0 to 1 (negative to positive).")

# write visualization to PNG
ggsave("topic_avg.png", topic_avg, height = 30, width = 35)
