library(ggridges)
library(tidyverse)

set.seed(4)

means10 = replicate(10, mean(rnorm(10)))
means100 = replicate(100, mean(rnorm(10)))
means1000 = replicate(1000, mean(rnorm(10)))

means = c(means10,means100,means1000)
Samples = c(rep('10',10), rep('100',100), rep('1000',1000))
  
df = data.frame(means,names)

ggplot(df, aes(x = means, y = Samples)) + geom_density_ridges()

ggplot(df, aes(x = means, y = Samples, height = stat(density), fill=Samples)) + 
  labs(x = expression(bar(x)), y = "Number of Samples") +
  geom_density_ridges(stat = "binline", bins = 20, scale = 1.3, draw_baseline = FALSE) + 
  scale_y_discrete(limits=rev)
