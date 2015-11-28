# Description:
#   Let hubot explain crontab entry in normal english using prettycron
#
# Commands:
#   hubot explain me cron <cron entry> - Explains the cron <cron entry>
#
# Dependencies:
#   "prettycron": "^0.10.0"
#
# Authors:
#   mvanduijker


prettyCron = require('prettycron')
module.exports = (robot) ->

  robot.hear /explain me cron$/i, (msg) ->
    msg.send "send me your cron entry, for example: `0 0 * * * some_report.sh`"

  robot.hear /explain me cron( .*)/i, (msg) ->
    if msg.match[1]? and msg.match[1].trim()
      cronText = msg.match[1].trim()
      cronSplitted = cronText.split(' ')

      return msg.send "Invalid cron statement" if cronSplitted.length < 5

      cronParameters = cronSplitted.slice(0, 5).join(' ')
      cronExplain = prettyCron.toString(cronParameters)

      return msg.send "#{cronExplain}" if cronSplitted.length is 5

      cronExplain = cronExplain.charAt(0).toLowerCase() + cronExplain.slice(1)
      cronCommand = cronSplitted.slice(6).join(' ')

      return msg.send "The command #{cronCommand} will execute at #{cronExplain}"
