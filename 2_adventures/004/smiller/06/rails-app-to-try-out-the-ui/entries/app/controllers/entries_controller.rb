class EntriesController < ApplicationController

  def new
  end

  def create
    body = params[:body].split("\r\n")
    puts body
    render :new
  end
end
