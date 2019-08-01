class SessionsController < ApplicationController
  def index
    render_json(apps)
  end

  private

  def heroku
    #raise 401 unless request.env["bouncer.token"]
    PlatformAPI.connect_oauth("6cd00b20-fa73-4cd3-a34f-7f740375ef07")
  end

  def apps
    heroku.app.info("eric-test")
  end
end
