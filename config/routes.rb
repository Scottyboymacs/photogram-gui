Rails.application.routes.draw do
  Rails.application.routes.draw do
    get("/", { :controller => "photo", :action => "user_index" })
  
    get("/photos", { :controller => "photo", :action => "photo_index" })
    get("/photos/:path_id", { :controller => "photo", :action => "photo_detail" })

    get("/users", { :controller => "photo", :action => "user_index" })
    get("/users/:path_id", { :controller => "photo", :action => "user_detail" })


  end
  
end
