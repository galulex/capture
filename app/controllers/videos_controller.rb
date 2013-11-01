class VideosController < ApplicationController
  def new
  end

  def create
    render js: 'alert()'
  end
end
