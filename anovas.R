# Age vs Cluster
aov.age <- aov(Age ~ as.factor(cluster), data = echo.cluster)
summary(aov.age)


# Hr min
echo.aov.hr <- aov(HRmin ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.hr)

# DBP
echo.aov.dbp <- aov(DBP ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.dbp)

# SBP
echo.aov.sbp <- aov(SBP ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.sbp)


# EchoLA
echo.aov.echola <- aov(EchoLA ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echola)




# EchoIVS
echo.aov.echoivs <- aov(EchoIVS ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echoivs)


# EchoPW
echo.aov.echopw <- aov(EchoPW ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echopw)


# EchoDd
echo.aov.echodd <- aov(EchoDd ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echodd)


# EchoDs
echo.aov.echods <- aov(EchoDs ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echods)

# LV mass
echo.aov.echolvmass <- aov(LVMass ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolvmass)


# EchoLVMI
echo.aov.echolvmi <- aov(EchoLVMI ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolvmi)


# EchoEDV
echo.aov.echoedv <- aov(EchoEDV ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echoedv)


# EchoESV
echo.aov.echoesv <- aov(EchoESV ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echoesv)


# EchoEF
echo.aov.echoef <- aov(EchoEF ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echoef)


# EchoTMFeWave
echo.aov.echotmfewave <- aov(EchoTMfEwave ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echotmfewave)


# EchoTMFAwave
echo.aov.echotmfawave <- aov(EchoTMfAwave ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echotmfawave)


# TimeTMFDect
echo.aov.timetmfdect <- aov(TimeTMFDecT ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.timetmfdect)

# EchoTMFEtoA
echo.aov.echotmfetoa <- aov(EchoTMfEtoA ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echotmfetoa)


echo.aov.echolavi <- aov(EchoLAVI ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolavi)

echo.aov.echseptdie <- aov(EchSepTDIe ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echseptdie)

echo.aov.echolattdie <- aov(EchoLatTDIe ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolattdie)

echo.aov.echoavetdie <- aov(EchoAveTDIe ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echoavetdie)

echo.aov.echosetpee <- aov(EchoSeptEe ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echosetpee)

echo.aov.echolvm <- aov(EchoLVM ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolvm)

echo.aov.echolvmi <- aov(EchoLVMI ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.echolvmi)

echo.aov.bef <- aov(bEF ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.bef)

echo.aov.rwt <- aov(RWT ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.rwt)

echo.aov.rvsp <- aov(EchoRVSP ~ as.factor(cluster), data = echo.cluster)
summary(echo.aov.rvsp)


#detach(echo.cluster)
# missing : Lwave, Echo Lavi(A-L), EF<50 or EF>50

