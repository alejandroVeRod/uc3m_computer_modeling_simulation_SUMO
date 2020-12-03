read_sumo_data <- function(path){
  install.packages("rjson")
  library(jsonlite)
  trip_info <- fromJSON( path)
  return(flatten(trip_info$tripinfos$tripinfo))
}