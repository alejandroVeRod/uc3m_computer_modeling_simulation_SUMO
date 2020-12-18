#utilies
#install.packages('XML')
library('XML')

read_sumo_output <- function(path){
  print('Leyendo archivos base ......')
  docs <- list()
  
  file_path <- paste(path, 1:30,".output.xml",sep="")
  for (i in 1:length(file_path)) {
    docs <- append(docs, values = xmlTreeParse(file_path[[i]], useInternal = T))
  }
  return(docs)
}

get_mean_duration <- function(docs){
  duration_means <- list()
  for (i in 1:length(docs)){
    top = xmlRoot(docs[[i]])
    duration = as.numeric(xmlSApply(top,xmlGetAttr,"duration")) 
    duration_means <- append(duration_means, values = mean(duration))
  }
  return(duration_means)
}
get_mean_fuel <- function(docs) {
  mean_fuel <- list()
  for (i in 1:length(docs)){
    fuel = as.numeric(sapply(getNodeSet(docs[[i]],"//emissions"), xmlGetAttr,"fuel_abs"))
    mean_fuel <- append(mean_fuel, values = mean(fuel))
  }
  return(mean_fuel)
}
get_sum_fuel <- function(docs) {
  sum_fuel <- list()
  for (i in 1:length(docs)){
    fuel = as.numeric(sapply(getNodeSet(docs[[i]],"//emissions"), xmlGetAttr,"fuel_abs"))
    sum_fuel <- append(sum_fuel, values = sum(fuel))
  }
  return(sum_fuel)
}