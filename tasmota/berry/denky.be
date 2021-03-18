#-
# example of using Berry script to change the led color
# accordingly to power consumption
# using Denky (French Teleinfo reader)
-#

#- define the global symbol for reference -#
runcolor = nil

def runcolor()
  var pwr = energy.read().find('activepower',0)
  print(pwr)
  var red = tasmota.scaleuint(int(pwr), 0, 2500, 0, 255)
  var green = 255 - red
  var channels = [red, green, 0]
  tasmota.setlight({"channels":channels, "bri":64, "power":true})
  tasmota.settimer(2000, runcolor)
end

#- run animation -#
runcolor()