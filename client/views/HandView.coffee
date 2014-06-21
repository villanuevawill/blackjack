class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el

    @$('.score').text @collection.scores()[0]


    #include an each statement to drop each of the elements in the array

    #logic that checks the length of collection.scores.  If the length
    #is greater than 1, then we will display both [0] and [1]
    #otherwise, we only have access to just [0]

