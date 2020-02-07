class Application
   
   @@items = []
   
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path =="/items/"
      item= req.path.split("/items/").first

      item_name = @@items.find{|i| i.name == item}

      if item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{item_name.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end