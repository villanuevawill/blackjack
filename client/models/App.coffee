#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'flip', ->
    	if @.scores()[1]
    			@.hit()
     else if @.scores()[0] < 17 then @.hit()
      #add the logic to change this hand's revealed status

    @get('dealerHand').on 'add', ->
    	if @.scores()[0] < 17 then @.hit()
#Game Logic Compiled here


