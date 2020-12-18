source('util_sumo.R')
source('plot_sumo.R')

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


##PLOTTING DURATIONS
plot_multiple_boxplot(base.junction.mean_durations, new.junction.mean_durations, 'Comparación de media de tiempos', c('Modelo Base', 'Modelo Nuevo'))

##PLOTTING FUELS
plot_multiple_boxplot(base.junction.mean_fuel, new.junction.mean_fuel, 'Comparación de media de combustible', c('Modelo Base', 'Modelo Nuevo'))


##HISTOGRAMS
plot_histograms(base.junction.mean_durations, new.junction.mean_durations, 'Duraciones de Trayecto')
plot_histograms(base.junction.sum_fuel, new.junction.sum_fuel, 'Totales de gastos de combustible')

plot_lines(base.junction.sum_fuel, new.junction.sum_fuel, 'Combustible')
