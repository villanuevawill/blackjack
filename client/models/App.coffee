#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'flip', ->
    	if @.scores()[1] 
    		if @.scores()[1] <= 17
    			@.hit()
     else if @.scores() < 17 then @.hit()
      #if @.scores() > 17 and @.scores() < 21 then win

    @get('dealerHand').on 'add', ->
    	if @.scores() < 17 then @.hit()
#Game Logic Compiled here


