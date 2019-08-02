class SessionsController < ApplicationController
  def index
    render json: apps
  end

  private

  def heroku
    #raise 401 unless request.env["bouncer.token"]
    PlatformAPI.connect_oauth(ENV["HEROKU_OAUTH_SECRET"])
  end

  def apps
    heroku.app.info("eric-test")
  end
end
