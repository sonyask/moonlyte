class SpecialtiesController < ApplicationController
  
  before_filter :require_login,     :only => [:new, :edit, :create, :update, :destroy]
  before_filter :require_moonlyter, :only => [:new, :edit, :create, :update, :destroy] 
  before_filter :fetch_specialty,   :only => [:show, :edit, :update, :destroy]
  before_filter :require_editable,  :only => [:edit, :update, :delete]
  
  def index
    moonlyter = Moonlyter.find_by_id(params[:moonlyter_id])
    @specialties = moonlyter.specialties
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specialties }
    end
  end
  
  def show
    # fetch_specialty
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @specialty }
    end
  end
  
  def new
    @specialty = current_user.moonlyter.specialties.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @specialty }
    end
  end
  
  def edit
    # fetch_specialty
  end
  
  def create
    @specialty = current_user.moonlyter.specialties.build(params[:specialty])
    
    respond_to do |format|
      if @specialty.save
        format.html { redirect_to [@specialty.moonlyter, @specialty], notice: 'Specialty was successfully created.' }
        format.json { render json: @specialty, status: :created, location: [@specialty.moonlyter, @specialty] }
      else
        format.html { render action: "new" }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    # fetch_specialty
    
    respond_to do |format|
      updatedValues = params[:specialty]
      updatedValues.keep_if { |key, value| !(value === "") }
      
      if @specialty.update_attributes(updatedValues)
        format.html { redirect_to moonlyter_specialties_path(@specialty.moonlyter), notice: 'Specialty was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    # fetch_specialty
    @specialty.destroy
    respond_to do |format|
      format.html { redirect_to moonlyter_specialties_url(@specialty.moonlyter) }
      format.json { head :ok }
    end
  end

  # ---- Private Methods ----
  private
  
    def require_moonlyter
      unless is_moonlyter?(current_user)
        flash[:error] = "Need a moonlyter profile"
        redirect_to new_moonlyter_path
        false
      end
    end
    
    def fetch_specialty
      moonlyter = Moonlyter.find_by_id(params[:moonlyter_id])
      @specialty = moonlyter.specialties.find_by_id(params[:id])
    end
    
    def require_editable
     unless current_user.moonlyter === @specialty.moonlyter
       flash[:error] = "Uh oh wrong account"
       redirect_to root_path
       false
     end
    end
  

end
