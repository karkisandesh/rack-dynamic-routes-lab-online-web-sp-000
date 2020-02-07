class Application
   
   @@items = []
   
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      item= req.path.split("/items/").first

      item_name = @@items.find{|i| i.name == item}

    if req.path =="/items/item_name"

      if item_name.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{item_name.price}"
      end
    else
      resp.write "Item not found"
      resp.status = 404
    end

    resp.finish
  end
end