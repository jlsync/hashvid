class FlickrSearch

  def self.search(text)


    flickr = Flickr.new(RAILS_ROOT + '/config/flickr.yml')

    flickr.photos.search(
      :license => 5, # sharealike! I think.
      :text => text,
      :sort => "relevance",
      :per_page => 20,
      :page => 1 )

  end

end
