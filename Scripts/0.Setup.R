#setup script

#project to calculate Fcv, Fphi, SSBcv and SSBphi from an analysis of historic assessments and forecasts
#these parameters are required inputs for EqSim/MSE analyses 

#initial process described in the report WKMSYREF3


rm(list=ls())
gc()
try(dev.off(),silent=FALSE)

#packages
library(FLCore)

#locations
Stock.dir <- file.path("C:","Stocks","hom_27_2a4a5b6a7a-ce-k8")
#this analysis
Home.dir <- file.path(Stock.dir,"DataAnalysis","WHMFcvphi_SSBcvphi")
#stock assessments
Ass.dir <- file.path(Stock.dir,"Assessment")

