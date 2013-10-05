# Description:
#   Tell who you are
#
# Commands:
#   hubot whoami
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
	robot.respond /whoami/i, (msg) ->
		msg.send msg.message.user.name
