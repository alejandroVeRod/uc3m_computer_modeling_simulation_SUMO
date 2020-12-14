check_packages <- function(){
  packages <- c("rjson", "reticulate")
  install.packages(setdiff(packages, rownames(installed.packages())))
  library("rjson")
  library("reticulate")
}

read_xml_data <- function(path){
  check_packages()
  xmltojson <- import("xmltojson")
  data  <- xmltojson$read_xml(path)
  trip_info <- fromJSON( data)
  return(trip_info)
}

sumo_simulate <- function(conf_path, time){
  check_packages()
  print(getwd())
  sumo <- import("../../python/sumoSimulation")
  sumo$traci_simulate(conf_path,time)
}

multiply_flows <- function(){
  check_packages()
}