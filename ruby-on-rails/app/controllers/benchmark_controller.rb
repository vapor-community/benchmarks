class BenchmarkController < ApplicationController
  def ping
    render plain: '123'
  end
end
