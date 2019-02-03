class Application

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
    else
     resp.write "Path Not Found"
   end

   resp.finish
 end
end
