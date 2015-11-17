require "minitest/autorun"

class PokerHandsTest < Minitest::Test

  CARDS_VALUE = %w(2 3 4 5 6 7 8 9 J Q K A)

  def test_high_card_wins
    result = wins('Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH')
    assert_equal('White wins. - with high card: A', result)
  end


  def wins(input)
    result = input.gsub('Black: ', '')
    result = result.gsub('White: ', '')
    black = result.split('  ')[0]
    white = result.split('  ')[1]
    max_black = max_card(black.split(' '))
    max_white = max_card(white.split(' '))

    if (max_black > max_white)
      return "Black wins. - with high card: #{CARDS_VALUE[max_black]}"
    else
      return "White wins. - with high card: #{CARDS_VALUE[max_white]}"
    end
  end

  def max_card(hand, max=0)
    return max if hand.empty?

    first = hand[0][0]
    max = CARDS_VALUE.index(first) if CARDS_VALUE.index(first) > max

    hand.shift
    max_card(hand, max)
  end
end

