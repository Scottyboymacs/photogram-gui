class ApplicationController < ActionController::Base

  def homepage
    render({ :template => "templates/home.html.erb"})
  end

end
