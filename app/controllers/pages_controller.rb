class PagesController < ApplicationController
  def about
    @about = Page.find_by(title: "About Us")
  end
  
  def contact
    @contact = Page.find_by(title: "Contact Us")
  end
end
