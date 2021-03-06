## -- Dependencies -------------------------------------------------------------

sailor    = require 'sailorjs'
translate = sailor.translate
errorify  = sailor.errorify

## -- Exports ------------------------------------------------------------------

module.exports =

  endpoint: (req, res)->
    req.assert('method', translate.get "Mandrill.Method.NotFound").notEmpty()
    req.assert('action', translate.get "Mandrill.Action.NotFound").notEmpty()
    return res.badRequest(errorify.serialize(req)) if req.validationErrors()

    params = do req.params.all

    method = params.method
    action = params.action

    delete params.action
    delete params.method

    MandrillService.api method, action, params, (err, response) ->
      return res.badRequest(err) if err
      res.ok(response)
