#calculate uncertainty parameters

#deviation of logs
#dfComp$DevLnF <- log(dfComp$Forecast.F/dfComp$Ass.F)
#AC 04/02 above incorrect? - need to check this
dfComp$DevLnF <- log(dfComp$Ass.F/dfComp$Forecast.F)

plot(dfComp$Year[!is.na(dfComp$DevLnF)],dfComp$DevLnF[!is.na(dfComp$DevLnF)],
     type="l",ylim=c(-0.5,0.5), xlab="Year", ylab="Ln(ForecastF) - Ln(AssessmentF)")
abline(h=0)

#sd of the log deviations gives the marginal distribution
sigm.F <- sd(dfComp$DevLnF,na.rm = TRUE)
#autocorrelation at lag 1
phi.F <- acf(dfComp$DevLnF[!is.na(dfComp$DevLnF)])[[1]][2,,]
#conditional SD
sigc.F <- sigm.F * sqrt(1-phi.F^2)

#dfComp$DevLnSSB <- log(dfComp$Forecast.SSB/dfComp$Ass.SSB)
dfComp$DevLnSSB <- log(dfComp$Ass.SSB/dfComp$Forecast.SSB)
plot(dfComp$Year[!is.na(dfComp$DevLnSSB)],dfComp$DevLnSSB[!is.na(dfComp$DevLnSSB)],
     type="l",ylim=c(-0.5,0.5), xlab="Year", ylab="Ln(ForecastSSB) - Ln(AssessmentSSB)")
abline(h=0)

#sd of the log deviations gives the marginal distribution
sigm.SSB <- sd(dfComp$DevLnSSB,na.rm = TRUE)
#autocorrelation at lag 1
phi.SSB <- acf(dfComp$DevLnSSB[!is.na(dfComp$DevLnSSB)])[[1]][2,,]
#conditional SD
sigc.SSB <- sigm.SSB * sqrt(1-phi.SSB^2)

cat("F parameters", sigc.F, phi.F,"\n")
cat("SSB parameters", sigm.SSB, phi.SSB, "\n")

#test edit
