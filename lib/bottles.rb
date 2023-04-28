class Bottles
  class Wall
    def initialize(bottle_count)
      @bottle_count = bottle_count
    end

    def contents
      case @bottle_count
      when 1
        "1 bottle"
      when 0
        "no more bottles"
      else
        "#{@bottle_count} bottles"
      end
    end
  end

  def action(n)
    wall = Wall.new(n-1)
    pronoun = (n == 1) ? "it" : "one"
    if n.zero?
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{pronoun} down and pass it around, #{wall.contents} of beer on the wall."
    end
  end

  def verse(n)
    wall = Wall.new(n)
    ["#{(wall.contents).capitalize} of beer on the wall, #{wall.contents} of beer.",
     action(n),
     ""].join("\n")
  end

  def verses(from, to)
    from.downto(to).map {|n| verse(n) }.join("\n")
  end

  def song
    verses(99,0)
  end
end
