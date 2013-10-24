# Description:
#   Greetings
#
# Configuration:
#   None
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
    robot.respond /make me a sandwich/i, (msg) ->
        oui = ["D'accord.", 'Oui!', 'OK, je le prépare.', 'Et un sandwich pour la 4, un!']
        non = ["Faites-le vous même!", 'nope', 'Hahaha, vous avez vraiment cru que je savais faire ça?', 'Plutôt mourrir!']

        if msg.message.user.name == 'sabron'
            msg.send msg.random(oui)
        else
            msg.send msg.random(non)
            
    robot.respond /sudo make me a sandwich/i, (msg) ->
        oui = ["D'accord.", 'Oui!', 'OK, je le prépare.', 'Et un sandwich pour la 4, un!']

        msg.send msg.random(oui)
