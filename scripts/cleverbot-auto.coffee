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
#   hubot c <input>
#
# Author:
#   ajacksified

cleverbot = require('cleverbot-node')

module.exports = (robot) ->
	c = new cleverbot()

	robot.catchAll (msg) ->
		ratio = robot.brain.get('cleverRatio')
		if Math.random() < ratio
			data = msg.message.text
			c.write(data, (c) => msg.send(c.message))
	
	robot.respond /set ratio (\d+)%?/i, (msg) ->
		robot.brain.set 'cleverRatio', msg.match[1]/100
		msg.send('New ratio: '+robot.brain.get('cleverRatio')*100+"%")
	
	robot.respond /get ratio/i, (msg) ->
		msg.send('Current ratio: '+robot.brain.get('cleverRatio')*100+"%")
