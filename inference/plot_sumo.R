plot_histograms <- function(data1, data2){
  xmin = min(c(data1,data2)) - 10
  xmax = max(c(data1,data2)) + 10
  
  hist(data1,ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0.5,0,0,0.5), breaks = 10)
  hist(data2,ylim=c(0,15),xlim=c(xmin,xmax),col = rgb(0,1,0,0.5), breaks = 10, add = T)
}

plot_boxplot <- function(data1, data2){
  xmin = min(c(base.roundabout.mean_durations,new.roundabout.mean_durations)) - 20
  xmax = max(c(base.roundabout.mean_durations,new.roundabout.mean_durations)) + 20
  par(mfrow = c(1, 1))
  boxplot(base.roundabout.mean_durations, ylim=c(xmin,xmax))
  boxplot(new.roundabout.mean_durations, ylim=c(xmin,xmax))
}