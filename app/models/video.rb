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


    #  can't search twitter down to each hour, so let's bucket them now.
    twit_buckets = {}
    twits.each do |twit|
      hour_start = DateTime.parse(twit.created_at).utc.strftime("%Y-%m-%d %H:00:00")
      (twit_buckets[hour_start] ||= [] ) << twit
    end

    # do the same with pictures
    pics_buckets = {}
    pics.each do |pic|
      hour_start = pic.taken_at.utc.strftime("%Y-%m-%d %H:00:00")
      (pics_buckets[hour_start] ||= [] ) << pic
    end
    
    @craftsman = Craftsman.new

    (twit_buckets.keys + pics_buckets.keys).uniq.sort_by{|x| DateTime.parse(x)}.each do |hour_key|

      @craftsman.add_comment(hour_key) # todo

      @craftsman.add_stack do
        if pics_buckets[hour_key]
          @craftsman.add_sequence do
            pics_buckets[hour_key].each do |pic|
              @craftsman.add_pic(pic.url(:original))
            end
          end
        end

        if twit_buckets[hour_key]
          @craftsman.add_sequence do
            twit_buckets[hour_key].each do |tweet|
              @craftsman.add_legend(tweet.from_user + ": " + tweet.text)
            end
          end
        end

      end

    end
    
    # add credits...
    credits = "flickr photos:\n" +
    pics.map{|p| p.owner_name + " - " + p.url_photopage}.join("\n") +
    "made by hashvid
    http://github.com/jlsync/hashvid/tree/master"
    @craftsman.add_sequence do
      @craftsman.add_legend(credits, :height => 1.0)
    end


  end

  def to_xml
    @craftsman.to_s
  end

end
