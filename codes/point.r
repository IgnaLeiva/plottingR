library(tidyverse)

# Read data
data <- read_csv("./data/Student_Mental_health.csv")

# Summary data
summary(data)

# Histogram

data %>%
    ggplot(aes(x = Age)) +
    geom_histogram(bins = 5) +
    theme_bw()


fit <- coxph(Surv(time, event) ~ age + sex + weight)
summary(fit)

Call:
coxph(formula = Surv(time, event) ~ age + sex + weight)

  n= 25000, number of events= 12464 

           coef exp(coef) se(coef)      z Pr(>|z|)    
age    0.986221  2.681085 0.011754 83.909   <2e-16 ***
sex    0.151580  1.163671 0.017949  8.445   <2e-16 ***
weight 0.319033  1.375797 0.009291 34.337   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

       exp(coef) exp(-coef) lower .95 upper .95
age        2.681     0.3730     2.620     2.744
sex        1.164     0.8593     1.123     1.205
weight     1.376     0.7269     1.351     1.401

Concordance= 0.73  (se = 0.002 )
Likelihood ratio test= 7969  on 3 df,   p=<2e-16
Wald test            = 7474  on 3 df,   p=<2e-16
Score (logrank) test = 7533  on 3 df,   p=<2e-16
