class FlickrSearch

  def self.search(text, date_from, date_to )

    flickr = Flickr.new(RAILS_ROOT + '/config/flickr.yml')

    flickr.photos.search(
      :license => "1, 2, 4, 5, 7",
      :text => text,
      :sort => "relevance",
      :min_taken_date => (date_from.is_a?(String) ? date_from : date_from.strftime("%Y-%m-%d")) +  " 00:00:00",
      :max_taken_date => (date_to.is_a?(String) ? date_to : date_to.strftime("%Y-%m-%d")) +  " 23:59:59",
      :per_page => 100,
      :page => 1 )

  end

end

#
# <license id="0" name="All Rights Reserved" url=""/>
# <license id="4" name="Attribution License" url="http://creativecommons.org/licenses/by/2.0/"/>
# <license id="6" name="Attribution-NoDerivs License" url="http://creativecommons.org/licenses/by-nd/2.0/"/>
# <license id="3" name="Attribution-NonCommercial-NoDerivs License" url="http://creativecommons.org/licenses/by-nc-nd/2.0/"/>
# <license id="2" name="Attribution-NonCommercial License" url="http://creativecommons.org/licenses/by-nc/2.0/"/>
# <license id="1" name="Attribution-NonCommercial-ShareAlike License" url="http://creativecommons.org/licenses/by-nc-sa/2.0/"/>
# <license id="5" name="Attribution-ShareAlike License" url="http://creativecommons.org/licenses/by-sa/2.0/"/>
# <license id="7" name="No known copyright restrictions" url="http://www.loc.gov/rr/print/195_copr.html#noknown"/>
# <license id="8" name="United States Government Work" url="http://www.copyright.gov/title17/92chap1.html#105"/>
#
