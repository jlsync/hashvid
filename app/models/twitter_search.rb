class TwitterSearch

  def self.search(text)

    search = Twitter::Search.new(text)
     
    puts '*'*50, 'First Run', '*'*50
    search.each { |result| puts result.inspect }
  end


end
