class MoonlytersController < ApplicationController
  # GET /moonlyters
  # GET /moonlyters.json
  def index
    @moonlyters = Moonlyter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moonlyters }
    end
  end
  
  # GET /moonlyters/1
  # GET /moonlyters/1.json
  def show
    @moonlyter = Moonlyter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moonlyter }
    end
  end
  
  # GET /moonlyters/new
  # GET /moonlyters/new.json
  def new
    @moonlyter = Moonlyter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moonlyter }
    end
  end
end
