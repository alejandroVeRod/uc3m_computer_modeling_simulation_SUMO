
read_sumo_output <- function(path){
  files <- list.files(path)
  docs <- list()
  for (i in 1:length(files)){
    file_path = paste(path,i,".output.xml",sep="")
    print(file_path)
    doc = xmlTreeParse(file_path, useInternal=TRUE)
    docs <- append(docs, values = doc)
  }
  return(docs)
}

get_mean_duration <- function(docs){
  duration_means <- list()
  for (i in 1:length(docs)){
    doc <- docs[[i]]
    top = xmlRoot(doc)
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