Rails.application.routes.draw do
  Rails.application.routes.draw do
    get("/", { :controller => "photo", :action => "user_index" })

    get("/photos", { :controller => "photo", :action => "photo_index" })
    get("/photos/:path_id", { :controller => "photo", :action => "photo_detail" })
    get("/delete_photo/:deletee_id", { :controller => "photo", :action => "delete_photo" })
    get("/add_photo", { :controller => "photo", :action => "add_photo" })
    get("/update_photo/:modified_photo", { :controller => "photo", :action => "update_photo" })
    get("/add_comment/:photo_id", { :controller => "photo", :action => "add_comment" })
    

    get("/users", { :controller => "photo", :action => "user_index" })
    get("/users/:path_id", { :controller => "photo", :action => "user_detail" })
    get("/add_user", { :controller => "photo", :action => "add_user" })
    get("/update_user/:username", { :controller => "photo", :action => "update_user" })

  end
  
end
