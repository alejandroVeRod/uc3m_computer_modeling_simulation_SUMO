install.packages("XML")
library('XML')

BASE_OUTPUT_PATH="../output/demandaBase/"
NEW_OUTPUT_PATH="../output/demandaNueva/"

base_mean_durations <- list()
base_sum_fuel  <- list()
for (i in 1:30){
  file_path = paste(BASE_OUTPUT_PATH,"cruce.",i,".output.xml",sep="")
  print(file_path)
  doc = xmlTreeParse(file_path, useInternal=TRUE)
  top = xmlRoot(doc)
  duration = as.numeric(xmlSApply(top,xmlGetAttr,"duration")) 
  fuel = as.numeric(sapply(getNodeSet(doc,"//emissions"), xmlGetAttr,"fuel_abs"))
  base_sum_fuel <- append(base_sum_fuel, values = sum(fuel))
  base_mean_durations <- append(base_mean_durations, values = mean(duration))
}


new_mean_durations <- list()
for (i in 1:30){
  file_path = paste(NEW_OUTPUT_PATH,"cruce.",i,".output.xml",sep="")
  print(file_path)
  doc = xmlTreeParse(file_path, useInternal=TRUE)
  top = xmlRoot(doc)
  duration = as.numeric(xmlSApply(top,xmlGetAttr,"duration")) 
  new_mean_durations <- append(new_mean_durations, values = mean(duration))
}

hist(as.numeric(base_mean_durations),col = rgb(0.5,0,0,0.5), breaks = 10)
hist(as.numeric(base_sum_fuel),col = rgb(0.5,0,1,0.5), breaks = 10)



hist(as.numeric(new_mean_durations), col = rgb(0,1,0,0.5), breaks = 10, add = T)


