# Description:
#   Greetings
#
# Configuration:
#   None
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
    robot.hear /(Salut|Bonjour|Yo|Poulpe|Hello|Hi)\s+Claris.*/i, (msg) ->
        bonjour = ['Salut', 'Bonjour', 'Hello', 'Heureux de vous revoir,']
        master = ['Maître', 'Créateur', 'Papa', 'Seigneur']

        sender = msg.message.user.name

        if sender == 'sabron'
            sender = msg.random(master)
        else
            sender = sender.charAt(0).toUpperCase() + sender.slice(1)

        msg.send msg.random(bonjour)+" "+sender

    robot.hear /(et)?[\s,\?]+(sinon)?[\s,\?]+((Comment)?(ça va)|(Tu vas bien)|(ça roule)|(ça farte))[\s,\?]+Claris.*/i, (msg) ->
        bien = ["Bien bien", "Pas mal", "Oui", "Bof", "Super", "Imothep"]
        etToi= ["et toi?", "et vous?", ""]
        msg.send msg.random(bien)+" "+msg.random(etToi)