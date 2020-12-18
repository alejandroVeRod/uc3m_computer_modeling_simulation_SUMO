source('apartadoA.r')
source('apartadoB.r')
install.packages("Rcmdr")
library(Rcmdr)

#TEST DE NORMALIDAD
#Test ks para media duraciones
ks.test(new.junction.mean_durations, new.roundabout.mean_durations)
ks.test(new.junction.mean_durations, new.turboRoundabout.mean_durations)
#Test ks para media fuel
ks.test(new.junction.mean_fuel, new.roundabout.mean_fuel)
ks.test(new.junction.mean_fuel, new.turboRoundabout.mean_fuel)

#TEST de homocedasticidad
##test de levene para media duracion
g=as.factor(c(rep(1, length(new.junction.mean_durations)), rep(2, length(new.roundabout.mean_durations))))
z = c(new.junction.mean_durations, new.roundabout.mean_durations)
leveneTest(z , g, center="mean")

g=as.factor(c(rep(1, length(new.junction.mean_durations)), rep(2, length(new.turboRoundabout.mean_durations))))
z = c(new.junction.mean_durations, new.turboRoundabout.mean_durations)
leveneTest(z , g, center="mean")

##Test de levenne para media fuel
g=as.factor(c(rep(1, length(new.junction.mean_fuel)), rep(2, length(new.roundabout.mean_fuel))))
z = c(new.junction.mean_fuel, new.roundabout.mean_fuel)
leveneTest(z , g, center="mean")

g=as.factor(c(rep(1, length(new.junction.mean_fuel)), rep(2, length(new.turboRoundabout.mean_fuel))))
z = c(new.junction.mean_fuel, new.turboRoundabout.mean_fuel)
leveneTest(z , g, center="mean")

#CONTRASTE DE MUESTRAS
#TEST DE WELCH para media fuel
t.test(new.junction.mean_fuel, new.roundabout.mean_fuel, var.equal = FALSE)
t.test(new.junction.mean_fuel, new.turboRoundabout.mean_fuel, var.equal = FALSE)

#Test de student para media duraciones
t.test(new.junction.mean_durations,new.roundabout.mean_durations)
t.test(new.junction.mean_durations,new.turboRoundabout.mean_durations)




