require('zepto')
B = require('backbone')
B.$ = $
M = require('backbone.marionette')


handler = require('./handler')
tpl = require('./tpl')


router = M.AppRouter.extend
  controller: handler
  appRoutes:
    'login': 'login'
    'register': 'register'
    '*default': 'default'


app = new M.Application()

app.on 'start', ()->
  R = new router()

  B.history.start
    pushState: true
    root:'/'

  $('#wrap').append $(tpl.base())
  $(document).on 'click', 'a[href^="/"]', (e)->
    e.preventDefault()
    R.navigate $(e.currentTarget).attr('href').substr(1), {trigger: true}


module.exports = app
