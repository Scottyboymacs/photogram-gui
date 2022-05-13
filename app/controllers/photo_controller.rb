class PhotoController < ActionController::Base

  def photo_index
    @all_photos = Photo.all.order({:created_at => :desc})
    @photographers = User.all
    render({ :template => "templates/photo_index.html.erb"})
  end

  def photo_detail 
    @photo = Photo.where(:id => params.fetch("path_id")).first
    @photographers = User.all
    @comments = Comment.where(:photo_id => @photo.id).order({:created_at => :desc})

    render({ :template => "templates/photo_detail.html.erb"})
  end

  def delete_photo
    @deletee = Photo.where(:id => params.fetch("deletee_id")).first.destroy
    #render({ :template => "templates/photo_delete.html.erb"})
    redirect_to("/photos")
  end

  def add_photo
  image = params.fetch("image")
  caption = params.fetch("caption")
  owner_id = params.fetch("owner_id")

  new_photo = Photo.new

  new_photo.image = image
  new_photo.caption = caption
  new_photo.owner_id = owner_id

  new_photo.save
  #render({ :template => "templates/add_photo.html.erb"})
  redirect_to("/photos/#{new_photo.id}")
  end

  def update_photo
    photo_id = params.fetch("modified_photo")
    image = params.fetch("input_image")
    caption = params.fetch("input_caption")
    the_photo = Photo.where({:id => photo_id}).first
    the_photo.image = image
    the_photo.caption = caption
    the_photo.save
    redirect_to("/photos/#{photo_id}")
  end

  def add_comment

    photo_id = params.fetch("photo_id")
    body = params.fetch("input_body")
    author = params.fetch("input_author")
    photo = Photo.where({:id => photo_id}).first
    
    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.body = body
    new_comment.author_id = author
    new_comment.save
    redirect_to("/photos/#{photo_id}")
  end

  def user_index
    @list_of_users = User.all.order({:username => :asc})
    render({ :template => "templates/home.html.erb"})
  end  

  def add_user
    username = params.fetch("new_username")
  
    new_user = User.new
  
    new_user.username = username
 
    new_user.save
    redirect_to("/users/#{username}")
    #render({ :template => "templates/new_user.html.erb"})
  end

  def update_user
    old_username = params.fetch("username")
    new_username = params.fetch("input_username")
  
    updated_user = User.where({:username => old_username}).first
  
    updated_user.username = new_username
 
    updated_user.save
    redirect_to("/users/#{new_username}")
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
