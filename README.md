# WHMFcvphi_SSBcvphi
Calculate the EqSim uncertainties for WHM

EqSim requires information on the performance of the history of the assessment with respect to F and,
optionally SSB. The methodology is described in the WKMSYREF3 report (page 11). A comparison is made between the 
most recent assessment and the predicted F/SSB from historic forecasts.

The realised catch and F (Fyr) are taken from the most recent assessment. The annual advice sheets and WG reports issued in y-1 are examined to determine the estimate the F (Fad) that would have been advised to obtain the realised catch (interpolating between two catch options if necessary). The deviation of each year is calculated as ln(Fyr/Fad) and it's standard deviation yields the marginal distribution (sigm).

The conditional standard deviation is then calculated from sigc = sigm * sqrt(1-phi^2) where phi is the autocorrelation of the AR(1) process. sigc and phi are supplied to the two parameter function in EqSim.