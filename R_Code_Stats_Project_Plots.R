library(magrittr)
library(ggpubr)
library(ggplot2)

b <- ggplot(SRHDI, aes(x = HDI, y = Suicide_per_100k))
# Scatter plot with regression line
b + geom_point(shape=18) + geom_smooth(method = "lm") 



# Add regression line and confidence interval
# Add correlation coefficient: stat_cor()
ggscatter(SRHDI, x = "HDI", y = "Suicide_per_100k",shape = 3,
          size = 1, color = "red",
          add = "reg.line", conf.int = TRUE,    
          add.params = list(fill = "gray"),
          ggtheme = theme_minimal()
)+
  stat_cor(
    aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")), 
    label.x = 0.6, label.y=30
  )

