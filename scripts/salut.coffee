# Description:
#   Greetings
#
# Configuration:
#   None
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
	robot.hear /(Salut|Bonjour|Yo|Poulpe|Hello|Hi)\s+Claris/i, (msg) ->
		bonjour = ['Salut', 'Bonjour', 'Hello', 'Heureux de vous revoir,']
		master = ['Maître', 'Créateur', 'Papa', 'Seigneur']
		
		sender = msg.message.user.name
		
		if sender == 'sabron'
			sender = msg.random(master)
		
		msg.send msg.random(bonjour)+" "+sender
	
