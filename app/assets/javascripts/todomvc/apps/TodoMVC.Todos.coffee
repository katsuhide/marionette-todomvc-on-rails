@TodoMVC.module 'Todos', (Todos, App, Backbone) ->

	# Todo Model
	class Todos.Todo extends Backbone.Model
		defaults:
			title: ''
			completed: false
			created: 0

		initialize: ->
			if @isNew then @set 'created', Date.now()

		toggle: ->
			# @set 'completed', !@isCompleted()
	  	@save(completed: !@get('completed'))

		isCompleted: ->
			@get 'completed'

	# Todo Collection
	class Todos.TodoList extends Backbone.Collection
		model: Todos.Todo
		url: 'api/todos'

		# localStorage: new Backbone.LocalStorage 'todos-backbone-marionette'

		done: ->
    	@where(completed: true)

  	remaining: ->
	  	@without.apply(this, @done())

		getCompleted: ->
			@filter @._isCompleted

		getActive: ->
			@reject @._isCompleted

		comparator: (todo) ->
			todo.get 'created'

		_isCompleted: (todo) ->
			todo.isCompleted()
