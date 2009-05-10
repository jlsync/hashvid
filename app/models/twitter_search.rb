class TwitterSearch

  class Twitter::Search
    def until_date(date)
      @query[:until] = date.is_a?(String) ? date : date.strftime("%Y-%m-%d")
      self
    end

    def since_date(date)
      @query[:since] = date.is_a?(String) ? date : date.strftime("%Y-%m-%d")
      self
    end

  end


  def self.search(text, from , to  )
    search = Twitter::Search.new(text).since_date(from).until_date(to)
     
    #puts '*'*50, 'First Run', '*'*50
    #search.each { |result| puts result.inspect }
    search.fetch
  end

end
