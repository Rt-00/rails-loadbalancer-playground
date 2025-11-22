class StatusController < ApplicationController
  def index
    render json: {
      host: Socket.gethostname,
      time: Time.now
    }
  end
end
