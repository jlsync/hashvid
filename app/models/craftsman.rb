class Craftsman 

  attr_accessor :image_urls

  # texteffects:  http://wiki.stupeflix.com/doku.php?id=texteffects 
  TEXT = { :type => [ :legend => { :direction => [ :up, :left, :right ], 
    :fontname => [], 
    :fontcolor => [], 
    :backgroundcolor => [],
    :height => 0.1,  # 0.0 .. 1.0
    :zone => { }
  }
  ]
  }

  # effects: http://wiki.stupeflix.com/doku.php?id=effects
  # common effects params:  duration, timeOffset
  EFFECTS = [ :diving, :explode, :flower, :kenburns, :none, :panel, :rectangles, :rotator, :slice, :sliding, :square ]

  #filters: http://wiki.stupeflix.com/doku.php?id=filters


  def initialize 
    @image_urls = []
  end

  # "http://farm4.static.flickr.com/3497/3248180119_a71f2d9288_o.jpg"
  # "http://farm2.static.flickr.com/1013/3174424411_d3c339629a_b.jpg"

  def to_s 
    builder = Builder::XmlMarkup.new(:indent => 2)
    xml = builder.movie(:service => 'craftsman-1.0') do |movie|
      movie.body do |body|
        body.stack do |stack|

          duration = 0
          @image_urls.each do |image_url|

            stack.effect(:type => EFFECTS[rand(EFFECTS.size)], :duration => duration += 4 ) do |effect|
              effect.image(:filename => image_url )
            end
          end

          stack.audio(:filename => 'http://www.jesusjones.com/cvremixes/CultureVultureInvisibleSystemSubRemix.mp3', :fadeout => '2')

          stack.text("Text text text!", :type => 'legend')

        end
      end
    end
  end

end

