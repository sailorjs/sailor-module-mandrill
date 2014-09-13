## -- Dependencies -----------------------------------------------------------------------

url       = require './helpers/urlHelper'
should    = require 'should'
request   = require 'superagent'

## -- Test ------------------------------------------------------------------------------

describe "Mandrill :: API", ->

  xdescribe '200 OK', ->

    describe 'Campaigns', ->

      it 'get a list', (done) ->
        request
        .get url.mandrill + "/campaigns/list"
        .end (res) ->
          res.status.should.equal 200
          done()

  describe '400 BadRequest', ->

    it 'bad formed query', (done) ->
      request
      .get url.mandrill
      .end (res) ->
        res.status.should.equal 400
        done()

    it 'API path bad formed', (done) ->
      request
      .get url.mandrill + "/CAMPAIGNS/LIST"
      .end (res) ->
        res.status.should.equal 400
        done()
