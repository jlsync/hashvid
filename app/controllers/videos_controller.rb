class VideosController < ApplicationController
  def new
    @video = Video.new(:date_from => 1.day.ago.to_date , :date_to => Time.now.to_date )
  end

  def create

    @video = Video.new(params[:video])
    @video.make_video
    send_data( @video.to_xml,
              :type => "text/plain",
              :disposition => "inline",
              :filename => @video.search_text + ".txt" ) 

  end

  def show
  end

end
