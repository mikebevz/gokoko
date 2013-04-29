class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_location
  
  def get_location
    @locations = Location.all
    
    if !session[:current_location].blank?
      @current_location = Location.find(session[:current_location])
    else
      @current_location = @locations.first
    end  
    
    if !params[:loc].blank?
      @current_location = Location.find(params[:loc])
    end

    if @current_location != nil
     session[:current_location] = @current_location.id
    end

    get_image_url

  end

  def get_image_url
    require 'extractula'
    require 'open-uri'
    require 'pismo'

    url = "http://ua-reporter.com/novosti/134690"
    some_html = open("http://ua-reporter.com/novosti/134690").read

    extracted_content = Extractula.extract(url, some_html)

    doc = Pismo::Document.new('http://www.rubyinside.com/cramp-asychronous-event-driven-ruby-web-app-framework-2928.html')
    doc.images[0]
    extracted_content.title       # pulled from the page
    extracted_content.url         # what you passed in
    extracted_content.content     # the main content body (article, blog post, etc)
    extracted_content.summary     # an automatically generated plain text summary of the content
    extracted_content.image_urls  # the urls for images that appear in the content
    extracted_content.video_embed # the embed code if a video is embedded in the content
  end

end
