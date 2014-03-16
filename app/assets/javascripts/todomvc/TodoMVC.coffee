TodoMVC = window.TodoMVC = new Backbone.Marionette.Application()

TodoMVC.addRegions
	header: '#header'
	main: '#main'
	footer: '#footer'

TodoMVC.on 'initialize:after', ->
	if !Backbone.History.started
		Backbone.history.start()

TodoMVC