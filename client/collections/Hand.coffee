class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce
      if score <=21 and score + 10 <= 21
        if score+10 >= 17 then score = [score+10]
        else score = [score+' or '+(score+10),score]
      else if score <= 21 then [score]
      else ['bust']
    else
      if score <= 21 then [score] else ['bust']
