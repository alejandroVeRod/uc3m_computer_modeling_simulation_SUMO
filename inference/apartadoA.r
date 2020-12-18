source('util_sumo.R')

#Read the sumo data from base estimation and new
BASE_OUTPUT_PATH="../ApartadoA/output/base/"
NEW_OUTPUT_PATH="../ApartadoA/output/nueva/"

base.junction <- read_sumo_output(BASE_OUTPUT_PATH)
new.junction <- read_sumo_output(NEW_OUTPUT_PATH)
#Extract the 'duration' tag and get the means
base.junction.mean_durations <- as.numeric(get_mean_duration(base.junction))
new.junction.mean_durations <- as.numeric(get_mean_duration(new.junction))
#Extract the 'fuel' tag and get the sums
base.junction.mean_fuel <- as.numeric(get_mean_fuel(base.junction))
new.junction.mean_fuel <- as.numeric(get_mean_fuel(new.junction))

base.junction.sum_fuel <- as.numeric(get_sum_fuel(base.junction))
new.junction.sum_fuel <- as.numeric(get_sum_fuel(new.junction))






##PLOTTING DURATION HISTOGRAMS
xmin = min(c(base.junction.mean_durations,new.junction.mean_durations)) - 20
xmax = max(c(base.junction.mean_durations, new.junction.mean_durations)) + 20

base_durations_hist <- hist(as.numeric(base.junction.mean_durations),ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0.5,0,0,0.5), breaks = 10)
new_durations_hist <- hist(as.numeric(new.junction.mean_durations),ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0,1,0,0.5), breaks = 20, add = T)

##PLOTTING FUEL HISTOGRAMS
xmin = min(c(base.junction.sum_fuel,new.junction.sum_fuel)) - 20
xmax = max(c(base.junction.sum_fuel,new.junction.sum_fuel)) + 20

hist(as.numeric(base.junction.sum_fuel), ylim=c(0,15), xlim=c(xmin,xmax), col = rgb(1,0,0,0.5), breaks = 10)
hist(as.numeric(new.junction.sum_fuel), ylim=c(0,15), xlim=c(xmin,xmax), col = rgb(0,1,1,0.5), breaks = 100, add = T)
