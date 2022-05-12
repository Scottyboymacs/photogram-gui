class PhotoController < ActionController::Base

  def photo_index
    @all_photos = Photo.all
    @photographers = User.all
    render({ :template => "templates/photo_index.html.erb"})
  end

  def photo_detail 
    @photo = Photo.where(:id => params.fetch("path_id")).first
    @photographers = User.all
    @comments = Comment.where(:photo_id => @photo.id).order({:created_at => :asc})

    render({ :template => "templates/photo_detail.html.erb"})
  end

  def user_index
    @list_of_users = User.all.order({:username => :asc})
    render({ :template => "templates/home.html.erb"})
  end  
  
  def user_detail
  @user = User.where({ :username => params.fetch("path_id") }).first
  if @user == nil 
    redirect_to("/404")
  end

  @photo_list = Photo.where({ :owner_id => @user.id })
  render({ :template => "templates/user_detail.html.erb"})
  end

end
