class StatusController < ApplicationController
  def index
    count = REDIS.incr("hits:#{INSTANCE_ID}")
    total = REDIS.incr("hits:total")

    render json: {
      host: Socket.gethostname,
      instace: INSTANCE_ID,
      instance_hits: count,
      total_hits: total,
      time: Time.now
    }
  end
end
