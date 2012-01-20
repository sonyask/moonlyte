class PagesController < ApplicationController

  skip_before_filter :require_login

  def index
  end

  def about
  end

  def contact
  end

end
