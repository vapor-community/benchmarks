class ApiController < ApplicationController
  def ping
    render plain: "pong"
  end
end
