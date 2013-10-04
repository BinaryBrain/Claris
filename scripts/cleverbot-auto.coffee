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

ratio = 0.1

module.exports = (robot) ->
	c = new cleverbot()

	robot.catchAll (msg) ->
		if Math.random() < ratio
			data = msg.message.text
			c.write(data, (c) => msg.send(c.message))
