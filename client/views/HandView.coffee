class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    if @collection.at(0).get('revealed') is true
      @$el.html @template @collection
    else @$el.html '<h2> Dealer (<span class="score"></span>)</h2>'
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    console.log(@collection)
    @$('.score').text @collection.scores()[0]


    #include an each statement to drop each of the elements in the array

    #logic that checks the length of collection.scores.  If the length
    #is greater than 1, then we will display both [0] and [1]
    #otherwise, we only have access to just [0]

