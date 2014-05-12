class DocusController < ApplicationController
 after_action :verify_authorized, except:  [:index, :about, :contact]

 # website home page action
  def index
   @city = City.first
  end

  # details about the deloper of PMIS
  def developer
   # redirect_to(:controller => 'docu', :action => 'index')
  end

  # about departmnets and city
  def about
   @department = Department.find_by name: 'Municipal Planning and Development Office'
   @city = City.first
  end

  # contact details of the organisations
  def contact
   @city = City.first
  end

end
