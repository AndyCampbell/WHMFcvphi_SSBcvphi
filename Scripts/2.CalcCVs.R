#calculate uncertainties


dfComp$DevLnF <- log(dfComp$Forecast.F) - log(dfComp$Ass.F)
plot(dfComp$Year[!is.na(dfComp$DevLnF)],dfComp$DevLnF[!is.na(dfComp$DevLnF)],
     type="l",ylim=c(-0.5,0.5), xlab="Year", ylab="Ln(ForecastF) - Ln(AssessmentF)")
abline(h=0)
#SAD assessment replaced in 2017 by SS3 which devised downwards the recent F
#the SAD was characterised by significant revision in F