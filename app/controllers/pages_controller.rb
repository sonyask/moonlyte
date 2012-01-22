class PagesController < ApplicationController

  #skip_before_filter :require_login

  def index
    @title = "Welcome"
  end

  def about
    @title = "about"
  end

  def contact
    @title = "contact us"
  end

end
