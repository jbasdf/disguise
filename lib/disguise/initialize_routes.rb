class ActionController::Routing::RouteSet
  def load_routes_with_disguise!
    disguise_routes = File.join(File.dirname(__FILE__), *%w[.. .. config disguise_routes.rb])
    add_configuration_file(disguise_routes) unless configuration_files.include? disguise_routes
    load_routes_without_disguise!
  end
  alias_method_chain :load_routes!, :disguise
end