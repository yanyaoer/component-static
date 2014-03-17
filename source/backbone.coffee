$ = require('semantic-ui')
Backbone = require('backbone')


cuckoo =
  init: ->
    R = new cuckoo.router()
    Backbone.history.start
      pushState: true
      root:'/'

    $(document).on 'click', 'a[href^="/"]', (e)->
      e.preventDefault()
      R.navigate $(e.currentTarget).attr('href').substr(1), {trigger: true}

  router: Backbone.Router.extend
    routes:
      'login': 'login'
      'register': 'register'
      '*default': 'default'

    register: ()->
      console.log 'register'
    login: ()->
      console.log 'login'
    default: ()->
      console.log 'hi'

    initialize: ->
      console.log 'init'

module.exports = cuckoo
