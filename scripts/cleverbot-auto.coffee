# Description:
#   "Makes your Hubot even more Clever™"
#
# Dependencies:
#   "cleverbot-node": "0.1.1"
#
# Configuration:
#   None
#
# Commands:
#   <input> - Answer with a given ratio.
#   hubot set ratio <n>% - Set the answer ratio to a certain percentage.
#   hubot get ratio - Give the current ratio.
#
# Author:
#   BinaryBrain

cleverbot = require('cleverbot-node')

module.exports = (robot) ->
	c = new cleverbot()

	robot.catchAll (msg) ->
		ratio = robot.brain.get('cleverRatio')
		bypass = false
		if(msg.message.text.match(/claris/i) != null)
			bypass = true
		if Math.random() < ratio || bypass
			data = msg.message.text
			c.write(data, (c) => 
				clevermsg = c.message
				if(clevermsg.substring(0,6) != "<html>")
					msg.send(clevermsg)
			)
			
	
	robot.respond /set ratio (\d+)%?/i, (msg) ->
		ratio = msg.match[1]
		if(ratio > 100)
			ratio = 100
		else if(ratio < 0)
			ratio = 0
		robot.brain.set 'cleverRatio', ratio/100
		msg.send('New ratio: '+robot.brain.get('cleverRatio')*100+"%")
	
	robot.respond /get ratio/i, (msg) ->
		msg.send('Current ratio: '+robot.brain.get('cleverRatio')*100+"%")
