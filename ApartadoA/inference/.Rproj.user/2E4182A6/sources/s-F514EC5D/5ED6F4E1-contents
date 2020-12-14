import traci
import sys

def traci_simulate(conf_path : "/conf/cruce.sumo.cfg", time):
  SUMO_HOME = "/usr/local/bin/sumo"
  sumoCmd = [SUMO_HOME, "-c", conf_path]
  traci.start(sumoCmd)
  step = 0
  while step < time:
    traci.simulationStep()
    step += 1
  traci.close()