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
    # make a new moonlighter if the user is signed in
    if signed_in? 
      if current_user.moonlyter.nil?
        @moonlyter = current_user.build_moonlyter

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @moonlyter }
        end
      else
        flash[:error] = "Moonlyter account already exists"
        redirect_to moonlyters_path
      end
    else
      flash[:error] = "Must be signed up first"
      redirect_to signin_path
    end
  end
  
  def create
    if signed_in?
      if current_user.moonlyter.nil?
        @moonlyter = current_user.build_moonlyter(params[:moonlyter])
        respond_to do |format|
          if @moonlyter.save
            format.html { redirect_to @moonlyter, notice: 'Moonlyter was successfully created.' }
            format.json { render json: @moonlyter, status: :created, location: @moonlyter }
          else
            format.html { render action: "new" }
            format.json { render json: @moonlyter.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:notice] = "Moonlyter account already exists"
        redirect_to moonlyters_path
      end
    else
      flash[:error] = "Must be signed up first"
      redirect_to signin_path
    end
      
  end
end
