source('util_sumo.R')
source('plot_sumo.R')


ROUNDABOUT_BASE_OUTPUT_PATH="../ApartadoB/output/baseRotonda/"
ROUNDABOUT_NEW_OUTPUT_PATH="../ApartadoB/output/nuevaRotonda/"

TURBO_ROUNDABOUT_BASE_OUTPUT_PATH="../ApartadoB/output/baseTurboRotonda/"
TURBO_ROUNDABOUT_NEW_OUTPUT_PATH="../ApartadoB/output/nuevaTurboRotonda/"

#ROUNDABOUT MODEL
base.roundabout <- read_sumo_output(ROUNDABOUT_BASE_OUTPUT_PATH)
new.roundabout <- read_sumo_output(ROUNDABOUT_NEW_OUTPUT_PATH)

#Extract the 'duration' tag and get the means
base.roundabout.mean_durations <- as.numeric(get_mean_duration(base.roundabout))
new.roundabout.mean_durations <- as.numeric(get_mean_duration(new.roundabout))
#Extract the 'fuel' tag and get the mea
base.roundabout.mean_fuel <- as.numeric(get_mean_fuel(base.roundabout))
new.roundabout.mean_fuel <- as.numeric(get_mean_fuel(new.roundabout))






##PLOTTING DURATION HISTOGRAMS
plot_histograms(base.roundabout.mean_durations, new.roundabout.mean_durations)
plot_histograms(base.roundabout.sum_fuel, new.roundabout.sum_fuel)

#Turbo Roundabout model
base.turboRoundabout <- read_sumo_output(TURBO_ROUNDABOUT_BASE_OUTPUT_PATH)
new.turboRoundabout <- read_sumo_output(TURBO_ROUNDABOUT_NEW_OUTPUT_PATH)

base.turboRoundabout.mean_durations <- as.numeric(get_mean_duration(base.turboRoundabout))
new.turboRoundabout.mean_durations <- as.numeric(get_mean_duration(new.turboRoundabout))

base.turboRoundabout.mean_fuel <- as.numeric(get_mean_fuel(base.turboRoundabout))
new.turboRoundabout.mean_fuel <- as.numeric(get_mean_fuel(new.turboRoundabout))


##PLOTTING DURATION HISTOGRAMS
xmin = min(c(base.turboRoundabout.mean_durations,new.turboRoundabout.mean_durations)) - 20
xmax = max(c(base.turboRoundabout.mean_durations,new.turboRoundabout.mean_durations)) + 20

base_durations_hist <- hist(base.turboRoundabout.mean_durations,ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0.5,0,0,0.5), breaks = 5)
new_durations_hist <- hist(new.turboRoundabout.mean_durations,ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0,1,0,0.5), breaks = 5, add = T)




