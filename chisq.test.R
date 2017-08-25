

# NYHA vs Cluster

```{r}


nyha.tbl <- table(echo.cluster$cluster, echo.cluster$NYHA)

chisq.test(nyha.tbl)

boxplot(echo.cluster$NYHA ~ echo.cluster$cluster, xlab = "Cluster", ylab = "NYHA", main = "Cluster by NYHA class")


```

# Diastolic 4 Parameter Count
```{r}

dias.tbl <- table(echo.cluster$cluster, echo.cluster$Diastolic4count)

chisq.test(dias.tbl)

boxplot(echo.cluster$Diastolic4count ~ echo.cluster$cluster, xlab = "Cluster", ylab = "Diastolic4count", main = "Diastolic4count class by cluster")


```

# Diastolic Dysfunction 3 or 4 of 4
```{r}

dias.dysfn.tbl <- table(echo.cluster$cluster, echo.cluster$DiastDysfunction3of4)

chisq.test(dias.dysfn.tbl)

boxplot(echo.cluster$DiastDysfunction3of4 ~ echo.cluster$cluster, xlab = "Cluster", ylab = "DiastDysfunction3of4", main = "DiastDysfunction3of4 class by cluster")


```

# Diastolic Count (low EF or 3/4)

```{r}

low.ef.tbl <- table(echo.cluster$cluster, echo.cluster$DiastCount)

chisq.test(low.ef.tbl)


boxplot(echo.cluster$DiastCount ~ echo.cluster$cluster, xlab = "Cluster", ylab = "DiastCount", main = "DiastCount class by cluster")

```

# Diastolic Dysfunction ASE (low EF or 3/4)
```{r}

dias.dysfn.ase.tbl <- table(echo.cluster$cluster, echo.cluster$DiastDysfunASE)

chisq.test(dias.dysfn.ase.tbl)


boxplot(echo.cluster$DiastDysfunASE ~ echo.cluster$cluster, xlab = "Cluster", ylab = "DiastDysfunASE", main = "DiastDysfunASE class by cluster")

```

# Etiology
```{r}

etiology.tbl <- table(echo.cluster$cluster, echo.cluster$Etiology)
etiology.tbl

chisq.test(etiology.tbl)



boxplot(echo.cluster$Etiology ~ echo.cluster$cluster, xlab = "Cluster", ylab = "Etiology", main = "Etiology class by cluster")

```



# LV Ejection fraction below 40%

```{r}

lv.ejection.tbl <- table(echo.cluster$cluster, echo.cluster$AbnormalEF50)

chisq.test(lv.ejection.tbl)

boxplot(echo.cluster$AbnormalEF50 ~ echo.cluster$cluster, xlab = "Cluster", ylab = "AbnormalEF50", main = "AbnormalEF50 class by cluster")

```
