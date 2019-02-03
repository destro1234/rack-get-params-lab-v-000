class Application

  @@items = ["Apples","Carrots","Pears"]
  @@carts = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/carts/)
      if @@carts.empty?
      resp.write "Your cart is empty"
      elsif req.path.match(/carts/)
      @@carts.each do |item|
        resp.write "#{item}\n"
      end
    end
    elsif req.path.match(/add/)
      search_term = req.params("item")
     if @@items.include?(search_term)
      @@carts << search_term
      resp.write "added #{search_term} to carts."
     else
      resp.write "#{search_term} is not an item."
    end

    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
