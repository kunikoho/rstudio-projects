---
title: "vorticity"
author: "Sirish Shrestha"
date: "August 13, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

Read the data for vorticity analysis
```{r cars}

setwd("C:/Users/siris/Documents/rstudio-projects/vorticity")

## read all echo data
echo <- read.csv("data.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE)

summary(echo)
str(echo)
## There are several missing data. We only select the ones we care about - the vortex data.
vorticity.data <- echo[,c(45:52)]


#
plot(vorticity.data)



mar <- par()$mar
par(mar=mar+c(0,5,0,0))

# seems like the variables are in different scales
barplot(sapply(vorticity.data, var), horiz=T, las=1, cex.names=0.8)

# in log scale
barplot(sapply(vorticity.data, var), horiz=T, las=1, cex.names=0.8, log='x')
par(mar=mar)



# Scale
data2 <- data.frame(scale(vorticity.data))
# Verify variance is uniform
plot(sapply(data2, var))


```





## Calculating PCA

```{r}

# Proceed with principal components
pc <- princomp(data2)
plot(pc)
plot(pc, type='l')
summary(pc) # 4 components is both 'elbow' and explains >85% variance



# Get principal component vectors using prcomp instead of princomp
pc <- prcomp(data2)

# First for principal components
comp <- data.frame(pc$x[,1:4])
# Plot
plot(comp, pch=16, col=rgb(0,0,0,0.5))

```


```{r}
library(rgl)
# Multi 3D plot
plot3d(comp$PC1, comp$PC2, comp$PC3)
plot3d(comp$PC1, comp$PC3, comp$PC4)


```

###Hierarchical Clustering packages


#### Load packages
```{r}
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(cluster))
suppressPackageStartupMessages(library(factoextra))
suppressPackageStartupMessages(library(dendextend))

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

```


```{r}

# Dissimilarity matrix
d <- dist(comp, method = "euclidean")

# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )

# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)



```



## For Hierarchical Clustering

usig Agnes to check the cluster structure

```{r pressure, echo=FALSE}
library(cluster)
library(purrr)

# methods to assess
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")

# function to compute coefficient
ac <- function(x) {
  agnes(comp, method = x)$ac
}

map_dbl(m, ac)
##  average    single  complete      ward 
##0.7656333 0.6595636 0.8810995 0.9480419 


```

### we select Ward's method since it's the strongest structure

```{r}

library(dplyr)
require(graphics)

# Ward's method
hc5 <- hclust(dist(comp, method = "euclidean"), method = "ward.D2" )

# Cut tree into 4 groups
sub_grp <- cutree(hc5, k = 3)

echo.cluster <- echo %>%
mutate(cluster = sub_grp)


plot(hc5, cex=0.6)
rect.hclust(hc5, k = 3, border = 2:5)

fviz_cluster(list(data = vorticity.data, cluster = sub_grp))


```


#PCA plot with cluster

```{r}

library(RColorBrewer)

palette(alpha(brewer.pal(9, 'Set1'), 0.5))
plot(comp, col=sub_grp, pch=16)



# 3D plot
plot3d(comp$PC1, comp$PC2, comp$PC3, col=sub_grp)
plot3d(comp$PC1, comp$PC3, comp$PC4, col=sub_grp)


```



```{r}


# Cluster sizes
sort(table(sub_grp))
clust <- names(sort(table(sub_grp)))

# First cluster
row.names(echo.cluster[sub_grp==clust[1],])
# Second Cluster
row.names(echo.cluster[sub_grp==clust[2],])
# Third Cluster
row.names(echo.cluster[sub_grp==clust[3],])


```

# Analysis of demographics with cluster

### Age vs Cluster

```{r}


# Age vs Cluster
aov.age <- aov(echo.cluster$Age ~ echo.cluster$cluster)
summary(aov.age)


#age range
echo.cluster$age.range <- cut(echo.cluster$Age, breaks=c(0,40, 60, 80, 200), right = FALSE, labels = c("1", "2", "3", "4"))


# Age range by cluster
# 1 : 0-39
# 2:  40 - 59
# 3:  60 - 79
# 4:  80 +

age.table <- table(echo.cluster$cluster, echo.cluster$age.range)

chisq.test(age.table)


```


# NYHA vs Cluster

```{r}


nyha.tbl <- table(echo.cluster$cluster, echo.cluster$NYHA)

chisq.test(nyha.tbl)

boxplot(echo.cluster$NYHA ~ echo.cluster$cluster, xlab = "Cluster", ylab = "NYHA", main = "NYHA class by cluster")


```

# Diastolic 4 Parameter Count
```{r}

dias.tbl <- table(echo.cluster$cluster, echo.cluster$Diastolic4count)

chisq.test(dias.tbl)

```

# Diastolic Dysfunction 3 or 4 of 4
```{r}

dias.dysfn.tbl <- table(echo.cluster$cluster, echo.cluster$DiastDysfunction3of4)

chisq.test(dias.dysfn.tbl)


```

# Diastolic Count (low EF or 3/4)

```{r}

low.ef.tbl <- table(echo.cluster$cluster, echo.cluster$DiastCount)

chisq.test(low.ef.tbl)


```

# Diastolic Dysfunction ASE (low EF or 3/4)
```{r}

dias.dysfn.ase.tbl <- table(echo.cluster$cluster, echo.cluster$DiastDysfunASE)

chisq.test(dias.dysfn.ase.tbl)

```

# Etiology
```{r}

etiology.tbl <- table(echo.cluster$cluster, echo.cluster$Etiology)

chisq.test(etiology.tbl)

```



# LV Ejection fraction below 40%

```{r}

lv.ejection.tbl <- table(echo.cluster$cluster, echo.cluster$AbnormalEF50)

chisq.test(lv.ejection.tbl)

```






















