class PhotoController < ActionController::Base

  def photo_index
    render({ :template => "templates/photo_index.html.erb"})
  end

  def photo_detail 
    render({ :template => "templates/photo_detail.html.erb"})
  end

  def user_index
    @list_of_users = User.all.order({:username => :asc})
    render({ :template => "templates/home.html.erb"})
  end  
  
  def user_detail
  render({ :template => "templates/user_detail.html.erb"})
end

end
