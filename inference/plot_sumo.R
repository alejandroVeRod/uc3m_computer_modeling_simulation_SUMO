plot_histograms <- function(data1, data2, title){
  xmin = min(c(data1,data2)) - 10
  xmax = max(c(data1,data2)) + 10
  
  hist(data1,ylim=c(0,30),xlim=c(xmin,xmax),col = rgb(0.5,0,0,0.5), breaks = 10, main = title)
  hist(data2,ylim=c(0,30),xlim=c(xmin,xmax),col = rgb(0,1,0,0.5), breaks = 10, add = T)
}

plot_multiple_boxplot <- function(data1, data2, title, leyend){
  boxplot(data1, data2,
          main = title,
          names = leyend,
          col = c("orange","red"),
          border = "brown",
          horizontal = TRUE,
          notch = TRUE
  )
}

plot_lines<- function(data1, data2, title){
  plot(data1,type="l",col="red", ylim = c(min(data1, data2), max(data1, data2)), main = title, xlab = 'X', ylab = 'Y')
  lines(data2,col="green")
}