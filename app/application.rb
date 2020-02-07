class Application
   
   @@items = []
   
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
  
    if req.path =="/items/"
      item_name = req.path.split("/items/").last

      item = @@items.find{|i| i.name == item_name}


      resp.write "#{item_name.price}"
    else
      resp.write "Item not found"
      resp.status = 400
    end
 
    resp.finish
  end
end