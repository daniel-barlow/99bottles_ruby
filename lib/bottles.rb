class Bottles
  class Wall
    def initialize(bottle_count)
      @bottle_count = bottle_count
    end

    def for_next_verse
      self.class.new(@bottle_count.zero? ? 99 :  @bottle_count - 1)
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

    def next_action
      pronoun = (@bottle_count == 1) ? "it" : "one"
      remaining = "#{self.for_next_verse.contents} of beer on the wall."

      if @bottle_count.zero?
        ["Go to the store and buy some more", remaining].join(", ")
      else
        ["Take #{pronoun} down and pass it around", remaining].join(", ")
      end
    end
  end

  def verse(n)
    wall = Wall.new(n)
    ["#{(wall.contents).capitalize} of beer on the wall, #{wall.contents} of beer.",
     wall.next_action,
     ""].join("\n")
  end

  def verses(from, to)
    from.downto(to).map {|n| verse(n) }.join("\n")
  end

  def song
    verses(99,0)
  end
end
