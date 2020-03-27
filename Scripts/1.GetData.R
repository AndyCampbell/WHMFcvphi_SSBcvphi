#compile assessments

#read in most recent assessment (WGWIDE 2019)
load(file=file.path(Ass.dir,"2019 WGWIDE","RData","WGWIDE2019.RData"))
WG19 <- WHOM.WGWIDE2019
name(WG19) <- "WGWIDE19"
rm(WHOM.WGWIDE2019)

#quick look
plot(WG19)

dfComp <- data.frame(Year = as.numeric(dimnames(WG19)$year),
                     Catch = as.numeric(FLCore::catch(WG19)),
                     Ass.F = as.numeric(FLCore::fbar(WG19)),
                     Forecast.F = NA,
                     Ass.SSB = as.numeric(FLCore::ssb(WG19)),
                     Forecast.SSB = NA,
                     stringsAsFactors = FALSE)


#2018 (Catch = 101,683)
#details from STF table, WGWIDE 2017, page 341
#2017 catch constraint = 95,500t
dfComp$Forecast.F[dfComp$Year==2018] = approx(x=c(99129,108515), y=c(0.081,0.089), xout=101682)$y
#forecast SSB for J1 
dfComp$Forecast.SSB[dfComp$Year==2018] = 818082

#2017 (Catch = 82,961)
#details from STF tables, WGWIDE 2016, pages 306-307
#2016 catch constraint = 124,403t
dfComp$Forecast.F[dfComp$Year==2017] = approx(x=c(82526,84289), y=c(0.1105,0.1130), xout=82961)$y
#forecast SSB for J1 
dfComp$Forecast.SSB[dfComp$Year==2017] = 511789

#2016 (Catch = 98810)
#details from STF tables, WGWIDE 2015, pages 302-303
#2015 catch constraint = 97,604t
dfComp$Forecast.F[dfComp$Year==2016] = approx(x=c(98544,99710), y=c(0.0997,0.1009), xout=98810)$y
#forecast SSB for J1
dfComp$Forecast.SSB[dfComp$Year==2016] = 718285

#2015 (Catch = 98,419)
#details from STF tables, WGWIDE 2014, pages 284-285
#2014 catch constraint = 133,220t
dfComp$Forecast.F[dfComp$Year==2015] = approx(x=c(85820,99304), y=c(0.1053,0.1229), xout=98419)$y
#forecast SSB for J1
dfComp$Forecast.SSB[dfComp$Year==2015] = 601099

#2014 (Catch = 136,360)
#details from STF tables, WGWIDE 2013, page 245-246
#2013 catch constraint 183,000t
dfComp$Forecast.F[dfComp$Year==2014] = approx(x=c(129640,144621), y=c(0.1541,0.1734), xout=136360)$y
#forecast SSB for J1
dfComp$Forecast.SSB[dfComp$Year==2014] = 749334

#2013 (Catch = 165,258)
#details from STF tables, WGWIDE 2012, page 234-235
#2012 catch constraint 183,000t
dfComp$Forecast.F[dfComp$Year==2013] = approx(x=c(155633,170000), y=c(0.1638,0.1800), xout=165258)$y
#forecast SSB for J1 
dfComp$Forecast.SSB[dfComp$Year==2013] = 1568380

#2012 (Catch = 169,859)
#details from STF tables, WGWIDE 2011, pages 246-247
#2011 catch constraint 183,000t
dfComp$Forecast.F[dfComp$Year==2012] = approx(x=c(155125,174007), y=c(0.0944,0.1064), xout=169859)$y
#forecast SSB from J1
dfComp$Forecast.SSB[dfComp$Year==2012] = 1879742

#2011 (Catch = 193,698)
#details from STF tables, WGWIDE 2010, pages 232-233
#2010 catch constraint 185,000t
dfComp$Forecast.F[dfComp$Year==2011] = approx(x=c(186433,201312), y=c(0.1048,0.1135), xout=193698)$y
#forecast SSB for J1
dfComp$Forecast.SSB[dfComp$Year==2011] = 1911900

#2010 (Catch = 203,112)
#No STF conducted

