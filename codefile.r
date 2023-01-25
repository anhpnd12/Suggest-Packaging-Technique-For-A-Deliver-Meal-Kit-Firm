# import data
Mealkits <- read.csv("Module2.csv")

library(psych)
describe(Mealkits)

describeBy(Mealkits, Mealkits$Packaging)

## Question 1
## One way ANOVA
res_aov <- aov(Mealkits$Attitudes~ factor (Mealkits$Packaging) , data = Mealkits)
summary(res_aov) 

## post-tests
## bonferroni adjustment
pairwise.t.test(Mealkits$Attitudes, Mealkits$Packaging, p.adj = "bonf")

## One way ANOVA
res_aov <- aov(Mealkits$Convenience~ factor (Mealkits$Packaging) , data = Mealkits)
summary(res_aov) 

## post-tests
## bonferroni adjustment
pairwise.t.test(Mealkits$Convenience, Mealkits$Packaging, p.adj = "bonf")

## Question 2
library(epiDisplay)
tab1(Mealkits$Meals, sort.group = "decreasing", cum.percent = TRUE)

## MANOVA
fit2 <- manova(cbind(Mealkits$Addon_Sales17, Mealkits$Holidaymeal_Sales17) ~ Mealkits$Meals, data=Mealkits)
summary(fit2, test = "Wilks") # ANOVA table of Wilks' lambda
summary.aov(fit2)             # univariate ANOVA tables

## Question 3
# regression
reg1 <- lm(Mealkits$Addon_Sales17 ~ Mealkits$Duration, data = Mealkits)
summary(reg1)

reg2 <- lm(Mealkits$Holidaymeal_Sales17 ~ Mealkits$Duration, data = Mealkits)
summary(reg2)

plot(Mealkits$Holidaymeal_Sales17,Mealkits$Duration,
     main='Holidaymeal_Sales Vs Duration',
     xlab='Holidaymeal_Sales', ylab='Duration')

## paired sample t-test
t.test(Mealkits$Addon_Sales16, Mealkits$Addon_Sales17, paired = TRUE, alternative = "two.sided")
t.test(Mealkits$Holidaymeal_Sales16, Mealkits$Holidaymeal_Sales17, paired = TRUE, alternative = "two.sided")

