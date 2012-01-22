class MoonlytersController < ApplicationController
  
  before_filter :require_login,     :only => [:new, :edit, :create, :update, :destroy]
  before_filter :fetch_moonlyter,   :only => [:show, :edit, :update, :destroy]
  before_filter :require_editable,  :only => [:edit, :update, :destroy]
  before_filter :require_not_yet_moonlyter, :only => [:new, :create]
  
  # GET /moonlyters
  # GET /moonlyters.json
  def index
    @title = "Moonlyters"
    @moonlyters = Moonlyter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moonlyters }
    end
  end
  
  # GET /moonlyters/1
  # GET /moonlyters/1.json
  def show
    @title = "Moonlyter"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moonlyter }
    end
  end
  
  # GET /moonlyters/new
  # GET /moonlyters/new.json
  def new
    @title = "become a Moonlyter!"
    @moonlyter = current_user.build_moonlyter
    @moonlyter.specialties.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moonlyter }
    end
  end
  
  # GET /moonlyters/1/edit
  def edit
    @title = "edit Moonlyter"
  end
  
  # POST /moonlyters
  # POST /moonlyters.json  
  def create
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
  end
  
  # PUT /moonlyters/1
  # PUT /moonlyters/1.json
  def update
    # only update the values that have things filled in
    updatedValues = params[:moonlyter]
    updatedValues.keep_if { |key, value| !value.blank? }

    respond_to do |format|
      if @moonlyter.update_attributes(updatedValues)
        format.html { redirect_to @moonlyter, notice: "Moonlyter was successfully updated." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @moonlyter.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /moonlyters/1
  # DELETE /moonlyters/1.json
  def destroy
    @moonlyter.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  private
    
    def fetch_moonlyter
      @moonlyter = Moonlyter.find(params[:id])
    end
    
    def require_editable
      unless current_user.moonlyter === @moonlyter
         flash[:error] = "Uh oh wrong account"
         redirect_to root_path
         false
      end
    end
    
    def require_not_yet_moonlyter
      current_moonlyter = current_user.moonlyter
      unless current_moonlyter.nil?
        flash[:error] = "Moonlyter account already exists"
        redirect_to current_moonlyter
        false
      end
    end
    
end
