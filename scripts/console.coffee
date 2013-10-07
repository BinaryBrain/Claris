# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot youtube me <query> - Searches YouTube for the query and returns the video embed link.
module.exports = (robot) ->
  robot.respond /console log (.*)/i, (msg) ->
    console.log msg.match[1]
    