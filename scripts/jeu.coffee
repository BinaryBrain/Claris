# Description:
#   You just lost the Game
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
  robot.hear /((Le )?jeu|(J'ai )?perdu|(I (just )? lost )?the game)/i, (msg) ->
#    lost = ["J'ai perdu", "J'ai perdu -_-", "Perdu -_-", "Perdu"]
#    msg.send msg.random lost
    msg.send "..."