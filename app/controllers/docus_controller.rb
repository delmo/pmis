class DocusController < ApplicationController
  def index
   @city = City.first
  end

  def developer
   # redirect_to(:controller => 'docu', :action => 'index')
  end

  def about
   @department = Department.find_by name: 'Municipal Planning and Development Office'
   @city = City.first
  end

  def contact
   @city = City.first
  end

end
