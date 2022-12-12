class WebsitesController < ApplicationController
  def index

  end

  def create
    long_url = params[:long_url]

    existent_website = Website.find_by_url(long_url)
    short_url = existent_website ? existent_website.short_url : Website.create(url: long_url, visited: 1).short_url

    existent_website.update!(visited: existent_website.visited + 1) if existent_website

    #GetTitleFromWebsiteJob.perform_async(website)

    render json: { short_url: "http://localhost:3000/#{short_url}" }
  end
end
