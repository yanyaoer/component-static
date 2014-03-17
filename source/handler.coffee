jade = require("jade")
B = require('backbone')
M = require('backbone.marionette')
tpl = require('./tpl')


module.exports =
  register: ()->
    console.log 'register'

  login: ()->
    console.log 'login'
    $('#contain').append $(tpl.login())

  default: ()->
    console.log tpl['404'](), tpl.base()
    console.log 'default'
