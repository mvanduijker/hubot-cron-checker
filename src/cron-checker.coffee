# Description:
#   Let hubot explain crontab entry in normal english from cronchecker.net
#
# Commands:
#   hubot explain me cron - Explains the cron <cron entry>
#
# Dependencies:
#   "cheerio": "^0.19.0"
#
# Authors:
#   mvanduijker


cheerio = require('cheerio')
croncheckerBaseUrl = 'http://cronchecker.net/check?statement='

module.exports = (robot) ->

  robot.hear /explain me cron$/i, (msg) ->
    msg.send "send me your cron entry, for example: `0 0 * * * some_report.sh`"

  robot.hear /explain me cron( .*)/i, (msg) ->
    if msg.match[1]? and msg.match[1].trim()
      cronText = msg.match[1].trim()

      msg.http(croncheckerBaseUrl + cronText).get() (error, response, body)->
        return msg.send "Sorry, something went wrong. http://croncheck.net still working?" if (error or response.statusCode not in [200, 302])

        return msg.send "Unrecognized cron statement `#{cronText}`" if response.statusCode == 302

        $ = cheerio.load(body)

        cronExplained = $('.cron-result')
          .html()
          .trim()
          .replace(/(?:\r\n|\r|\n)/g, ' ')
          .replace(/(<(\/?)code>)/g, '`')

        return msg.send cronExplained
