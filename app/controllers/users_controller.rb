class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  #skip_before_filter :require_login

  def index
    @users = User.all
    @current_user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
	      #send out a confirmation email
	      My_Mailer.confirm_email(@user).deliver

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # only update the values that have things filled in
    updatedValues = params[:user]
    updatedValues.keep_if { |key, value| !(value === "") }
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(updatedValues)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  # Class method to return user_id from session variable
  # TDL: make it also check for a salt
  def self.authenticate(user_id)
    user = find_by_id(user_id)
    return nil if user.nil?
    return user
  end
    
  
end
