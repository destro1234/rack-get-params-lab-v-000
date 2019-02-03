class Application

  @@items = ["Apples", "Carrots", "Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new

    if req.path.match(/items/)
      @@items.each do |item|
      resp.write "#{item}\n"
    end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      
    else
     resp.write "Path Not Found"
   end

   resp.finish
 end
end
