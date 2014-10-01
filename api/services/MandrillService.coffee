## -- Dependencies -------------------------------------------------------------

sailor         = require 'sailorjs'
translate      = sailor.translate
errorify       = sailor.errorify
MailChimp      = require 'mailchimp'
mandrillConfig = sails.config.mandrill

Mandrill_API   = MailChimp.MandrillAPI
Mandrill       = new Mandrill_API(mandrillConfig.key, { version : mandrillConfig.api.version, secure: mandrillConfig.api.secure })

## -- Exports ------------------------------------------------------------------

module.exports =

  api: (method, action, query, cb) ->
    Mandrill.call method, action, query, (err, data) ->
      unless err then cb(err, data) else cb(errorify.serialize err, data)
