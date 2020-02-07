class Application
   
   @@items = []
   
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    item_name = @@items.collect {|i| i.name}
    
    if req.path =="/items/item_name"
      resp.write "#{item_name.price}"
    else
      resp.write "Item not found"
      resp.status = 400
    end
 
    resp.finish
  end
end