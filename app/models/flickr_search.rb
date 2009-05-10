class FlickrSearch

  def self.search(text, date_from, date_to )

    flickr = Flickr.new(RAILS_ROOT + '/config/flickr.yml')

    flickr.photos.search(
      :license => 5, # sharealike! I think.
      :text => text,
      :sort => "relevance",
      :min_taken_date => (date_from.is_a?(String) ? date_from : date_from.strftime("%Y-%m-%d")) +  " 00:00:00",
      :max_taken_date => (date_to.is_a?(String) ? date_to : date_to.strftime("%Y-%m-%d")) +  " 23:59:59",
      :per_page => 20,
      :page => 1 )

  end

end
