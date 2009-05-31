ActionController::Routing::Routes.draw do |map|
  # admin
  map.namespace :admin do |a|
    a.resource :theme, :controller => 'disguise/themes'
  end
end