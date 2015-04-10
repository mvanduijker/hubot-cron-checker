chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'cron-checker', ->
  robot =
    respond: sinon.spy()
    hear: sinon.spy()

  beforeEach ->
    @robot = robot

  require('../src/cron-checker')(robot)

  it 'it registers "explain me cron" help listener', ->
    expect(@robot.hear).to.have.been.calledWith(/explain me cron$/i)

  it 'it registers "explain me cron" listener', ->
    expect(@robot.hear).to.have.been.calledWith(/explain me cron( .*)/i)
