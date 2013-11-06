# Description:
#   Where do you want to eat at EPFL?
#
# Commands:
#   hubot freeroom me <begin> <end> <day> [<filter>] - Searches Freeroom at EPFL. <filter> is optional. Ex: "9 11 mardi IN, BC, CO"
#   hubot freeroom me now [<filter>] - Searches Freeroom at EPFL now!
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
  robot.respond /freeroom(?: me)?\s+(\d+)\s+(\d+)\s+([a-zA-Z]+)(?:\s+((?:[a-zA-Z]+(?:,\s*[a-zA-Z]+)?)+))?.*/i, (msg) ->
    begin = msg.match[1]
    end = msg.match[2]
    day = msg.match[3]
    filter = msg.match[4] || ''
    
    robot.http("http://polyfood.ch/freeroom.php?begin="+begin+"&end="+end+"&day="+day+"&filter="+filter)
      .get() (err, res, body) ->
        fetchData(body, msg)
        
  robot.respond /freeroom(?: me)?\s+now(?:\s+((?:[a-zA-Z]+(?:,\s*[a-zA-Z]+)?)+))?.*/i, (msg) ->
    filter = msg.match[1] || ''
    
    robot.http("http://polyfood.ch/freeroom.php?now&filter="+filter)
      .get() (err, res, body) ->
        fetchData(body, msg)
            
  fetchData = (data, msg) ->
    rooms = JSON.parse(data).data
    
    unless rooms?
      msg.send "Aucune salle disponible :("
      return
    
    answer = rooms.join(", ")
    
    unless answer == ""
        msg.send(answer)
    else
        msg.send("Aucune salle disponible :(")