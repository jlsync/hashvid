
class Video < ActiveRecord::Base  #WithoutTable
  #column :search_text, :string
  #column :date_from, :date
  #column :date_to, :date
  
  tableless :columns => [
    [:search_text, :string],
    [:date_from, :date],
    [:date_to, :date] 
  ]

  

  attr_accessor :craftsman

  def make_video

    twits = TwitterSearch.search(search_text, date_from.to_s, date_to.to_s )
    pics =  FlickrSearch.search(search_text, date_from.to_s, date_to.to_s )

    @craftsman = Craftsman.new

    pics.each do |pic|
      @craftsman.image_urls << pic.url(:original)
    end

  end

  def to_xml
    @craftsman.to_s
  end

end
