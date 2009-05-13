class Craftsman 

  attr_accessor :image_urls
  attr_accessor :doc

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
    @duration = 4
    @doc = REXML::Document.new 
    @current = @doc.add_element("movie", 'service' => 'craftsman-1.0').add_element('body') # the "current" element
  end

  # "http://farm4.static.flickr.com/3497/3248180119_a71f2d9288_o.jpg"
  # "http://farm2.static.flickr.com/1013/3174424411_d3c339629a_b.jpg"
  
  def add_stack(&block)
    remember = @current
    @current = @current.add_element("stack") 
    yield @current if block_given? 
    @current = remember
  end

  def add_sequence(*args)
    remember = @current
    @current = @current.add_element("sequence") 
    yield @current if block_given? 
    @current = remember
  end

  def add_comment(text)
    # how to with REXML?
  end

  def add_flickr_pic(pic)
    @current.add_element("effect", 'type' => EFFECTS[rand(EFFECTS.size)], 'duration' => @duration).add_element("image", 'filename' => pic.url(:original) )
  end

  def add_tweet(tweet)
    @current.add_element("text", 'type' => 'legend').add_text( tweet.from_user + ": " + tweet.text )
  end

  def add_legend(text, options = {} )
    height = options[:height] || 0.1
    @current.add_element("text", 'type' => 'legend', 'height' => height).add_text(text)
  end


  def to_s 
    string = ""
    @doc.write string, 2
    string
  end

end


