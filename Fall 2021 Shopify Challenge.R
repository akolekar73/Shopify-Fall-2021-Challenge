# Question 1

setwd("~/Desktop/Recruiting/Shopify Application")
sink("shoplog.txt", split = TRUE, append = FALSE)

shopdata <- read.csv("Fall 2021 Shopify Data Science.csv", header = TRUE, sep=",")

sum(shopdata$order_amount)/nrow(shopdata) ## Validate previous calculation method
summary(shopdata$order_amount) ## Evaluate alternative central measure

# Histogram to visually represent data
library(lattice)
histogram(shopdata$order_amount, breaks = 100, type = "density", main = "Order Amount Distribution",
          xlab = "Order Bins", ylab = "Order Amount")

# Sneaker sale numbers are skewed because of a set of massive outliers. 
# Let's perform sensitivity analysis

outliers <- data.frame(shopdata$order_amount[shopdata$order_amount < 10000])
outlier2 <- data.frame(shopdata$order_amount[shopdata$order_amount < 5000])
outlier3 <- data.frame(shopdata$order_amount[shopdata$order_amount < 1000])

# Making things easier to work with
outliers$amount <- outliers$shopdata.order_amount.shopdata.order_amount...10000.
outlier2$amount <- outlier2$shopdata.order_amount.shopdata.order_amount...5000.
outlier3$amount <- outlier3$shopdata.order_amount.shopdata.order_amount...1000.

# Removing redundancy
outliers <- outliers[c(2)]
outlier2 <- outlier2[c(2)]
outlier3 <- outlier3[c(2)]

# Calculating the new averages, adjusted for outliers

summary(outliers)
summary(outlier2)
summary(outlier3)

# A) The calculation takes outliers into account when determining a central measure.
#    This data can be evaluated by removing the outliers, or the median statistic can be reported.
#    Performing the sensitivity analysis shows that when excluding all order sizes greater than 1000,
#    there is still little variation in the mean. The outlier-adjusted mean is 301.1 (orders < 1000) &
#    302.6 (orders < 5000 & orders < 10,000). The median is 284 which also paints a more accurate picture.

# B) I would report the median order. The data suggests that there are frequent high and low orders in the
#    system, and they would balance out by using the median, the central measure. Furthermore, when conducting
#    the sensitivity analysis, it became apparent that the adjusted means have no impact on the median and
#    are close to the median ( within ~ 6%). This suggests that a median is a strong central measure.

# C) The median of the data is 284.

sink()
