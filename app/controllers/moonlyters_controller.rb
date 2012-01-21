class MoonlytersController < ApplicationController
  
  #skip_before_filter :require_login
  
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
  
  # GET /moonlyters/1/edit
  def edit
    # TDL: change @moonlyter
    @moonlyter = Moonlyter.find(params[:id])
  end
  
  # POST /moonlyters
  # POST /moonlyters.json  
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
        flash[:error] = "Moonlyter account already exists"
        redirect_to moonlyters_path
      end
    else
      flash[:error] = "Must be signed up first"
      redirect_to signin_path
    end
  end
  
  # PUT /moonlyters/1
  # PUT /moonlyters/1.json
  def update
    # TDL: change @moonlyter
    # only update the values that have things filled in
    updatedValues = params[:moonlyter]
    updatedValues.keep_if { |key, value| !(value === "") }
    @moonlyter = Moonlyter.find(params[:id])

    respond_to do |format|
      if @moonlyter.update_attributes(updatedValues)
        format.html { redirect_to @moonlyter, notice: 'Moonlyter was successfully updated.' }
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
    # TDL: change @moonlyter
    @moonlyter = Moonlyter.find(params[:id])
    @moonlyter.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
