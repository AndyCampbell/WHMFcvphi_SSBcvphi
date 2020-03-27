#compile assessments

#read in most recent assessment (WGWIDE 2019)
load(file=file.path(Ass.dir,"2019 WGWIDE","RData","WGWIDE2019.RData"))
WG19 <- WHOM.WGWIDE2019
name(WG19) <- "WGWIDE19"
rm(WHOM.WGWIDE2019)

#quick look
#plot(WG19)

dfComp <- data.frame(Year = as.numeric(dimnames(WG19)$year),
                     Catch = as.numeric(FLCore::catch(WG19)),
                     Ass.F = as.numeric(FLCore::fbar(WG19)),
                     Forecast.F = NA,
                     Ass.SSB = as.numeric(FLCore::ssb(WG19)),
                     Forecast.SSB = NA,
                     stringsAsFactors = FALSE)

#2020 (Realised Catch = ???)
#WGWIDE 2019 STF forecast assumption: catch constraint of 110,381t for 2019 (80% of TAC to reflect reduced uptake in recent years) leading to 
#forecast SSB for January 1 2020 = 950,867t

#2019 (Realised Catch = ???)
#WGWIDE 2018 STF forecast assumption: catch constraint of 115,470t for 2018 leading to 
#forecast SSB for January 1 2019 = 941,821t

#2018 (Realised Catch = 101,683t)
#WGWIDE 2017 STF assumption: catch constraint of 95,500t for 2017 leading to
#forecast SSB for January 1 2018 = 818,082t.
#details from advice sheet and STF tables, WGWIDE report 2017, page 341
dfComp$Forecast.F[dfComp$Year==2018] = approx(x=c(99129,108515), y=c(0.081,0.089), xout=101682)$y
dfComp$Forecast.SSB[dfComp$Year==2018] = 818082

#2017 (Realised Catch = 82,961t)
#WGWIDE 2016 STF assumption: catch constraint of 124,403t for 2016 leading to
#forecast SSB for Spawning Time 2016 (May) = 489,616t - we need SSB for January 1 2017 for consistency with the updated assessment
#however, this is available from the STF table in the WGWIDE report 2016, pages 306-307
dfComp$Forecast.F[dfComp$Year==2017] = approx(x=c(82526,84289), y=c(0.1105,0.1130), xout=82961)$y
dfComp$Forecast.SSB[dfComp$Year==2017] = 511789

#2016 (Realised Catch = 98,810t)
#WGWIDE 2015 STF assumption: catch constraint of 97,604t for 2015 leading to
#forecast SSB for January 1 2016 = 718,285t
#details from STF tables, WGWIDE report 2015, pages 302-303
dfComp$Forecast.F[dfComp$Year==2016] = approx(x=c(98544,99710), y=c(0.0997,0.1009), xout=98810)$y
dfComp$Forecast.SSB[dfComp$Year==2016] = 718285

#2015 (Realised Catch = 98,419t)
#WGWIDE 2014 STF assumption: catch constraint of 133,220t for 2014 leading to
#Forecast SSB for January 2015 = 601,099t
#details from STF tables, WGWIDE report 2014, pages 284-285
dfComp$Forecast.F[dfComp$Year==2015] = approx(x=c(85820,99304), y=c(0.1053,0.1229), xout=98419)$y
dfComp$Forecast.SSB[dfComp$Year==2015] = 601099

#2014 (Realised Catch = 136,360t)
#WGWIDE 2013 STF assumption: catch constraint of 183,000t for 2013 leading to
#forecast SSB for January 1 2014 = 749,334t
#details from STF tables, WGWIDE report 2013, pages 245-246
dfComp$Forecast.F[dfComp$Year==2014] = approx(x=c(129640,144621), y=c(0.1541,0.1734), xout=136360)$y
dfComp$Forecast.SSB[dfComp$Year==2014] = 749334

#2013 (Realised Catch = 165,258t)
#WGWIDE 2012 STF assumption: catch constraint of 183,000t for 2012 leading to
#forecast SSB for January 1 2013 = 1,568,380t
#details from STF tables, WGWIDE report 2012, page 234-235
dfComp$Forecast.F[dfComp$Year==2013] = approx(x=c(155633,170000), y=c(0.1638,0.1800), xout=165258)$y
dfComp$Forecast.SSB[dfComp$Year==2013] = 1568380

#2012 (Realised Catch = 169,859t)
#WGWIDE 2011 STF assumption: catch constraint of 184,000t for 2011 leading to
#forecast SSB for January 1 2012 = 1,879,742t
#details from STF tables, WGWIDE report 2011, pages 246-247
dfComp$Forecast.F[dfComp$Year==2012] = approx(x=c(155125,174007), y=c(0.0944,0.1064), xout=169859)$y
dfComp$Forecast.SSB[dfComp$Year==2012] = 1879742

#2011 (Realised Catch = 193,698t)
#WGWIDE 2010 STF assumption: catch constraint of 185,000t for 2010 leading to
#forecast SSB for January 1 2011 = 1,911,900t
#details from STF tables, WGWIDE report 2010, pages 232-233
dfComp$Forecast.F[dfComp$Year==2011] = approx(x=c(186433,201312), y=c(0.1048,0.1135), xout=193698)$y
dfComp$Forecast.SSB[dfComp$Year==2011] = 1911900

#2010 (Catch = 203,112)
#No STF conducted

