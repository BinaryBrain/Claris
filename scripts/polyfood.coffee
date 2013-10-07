# Description:
#   Where do you want to eat at EPFL?
#
# Commands:
#   hubot polyfood me <restaurant> - Searches Polyfood for the restaurant.
#   hubot polyfood me all - Searches Polyfood for the every restaurants.
#
# Author:
#   BinaryBrain

module.exports = (robot) ->
  robot.respond /(polyfood|pf)( me)?( .*)?/i, (msg) ->
    restau = msg.match[3] || 'all'
    restau = restau.trim()
    robot.http("http://polyfood.ch/json.php")
      .get() (err, res, body) ->
        menu = JSON.parse(body)
        
        unless menu?
          msg.send "No menu avaiable"
          return
        
        answer = ""
        
        for plat in menu
            do (plat) ->
                if plat.description != ""
                    if restau == 'all' || plat.restaurant.nom.toLowerCase().indexOf(restau.toLowerCase()) != -1
                        unless answer == ""
                            answer += "\n----------\n"
                        answer += plat.restaurant.nom.trim()
                        answer += " ("+plat.prix.E.trim()+" CHF)"
                        answer += "\n"
                        answer += plat.description.replace /\n+/, " + "
                        
        unless answer == ""
            msg.send(answer)
        else
            msg.send("Aucun résultat :(")


            #{"logo":"1","description":"Steak de calamar \u00e0 l'armoricaine (VT)\nFenouille au beure\nPolenta au parmesan","restaurant":{"nom":"Caf\u00e9t\u00e9ria BC","lien":"http:\/\/restauration.epfl.ch\/bc"},"prix":{"E":" 7.00","V":" 10.50","D":" 8.00","C":" 9.00"}}