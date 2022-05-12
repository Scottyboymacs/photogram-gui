Rails.application.routes.draw do
  Rails.application.routes.draw do
    get("/", { :controller => "photo", :action => "user_index" })

    get("/photos", { :controller => "photo", :action => "photo_index" })
    get("/photos/:path_id", { :controller => "photo", :action => "photo_detail" })
    get("/delete_photos/:deletee_id", { :controller => "photo", :action => "delete_photo" })
    get("/add_photo/:added_image", { :controller => "photo", :action => "add_photo" })
    
    get("/users", { :controller => "photo", :action => "user_index" })
    get("/users/:path_id", { :controller => "photo", :action => "user_detail" })


  end
  
end
