require('zepto')
B = require('backbone')
M = require('backbone.marionette')
B.$ = M.$ = $


handler = require('./handler')
tpl = require('./tpl')


router = M.AppRouter.extend
  controller: handler
  appRoutes:
    'login': 'login'
    'register': 'register'
    '*default': 'default'


app = new M.Application()

app.on 'initialize:before', ()->
  $('#wrap').append $(tpl.base())


app.on 'initialize:after', ()->
  R = new router()

  B.history.start
    pushState: true
    root:'/'

  $(document).on 'click', 'a[href^="/"]', (e)->
    e.preventDefault()
    R.navigate $(e.currentTarget).attr('href').substr(1), {trigger: true}


module.exports = app
