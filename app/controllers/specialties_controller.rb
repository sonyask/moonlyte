class SpecialtiesController < ApplicationController
  
  def index
    @specialties = Specialty.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specialties }
    end
  end
  

end
