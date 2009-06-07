ActionController::Routing::Routes.draw do |map|
  # admin
  map.namespace :admin do |a|
    a.resource :theme, :controller => 'disguise/themes'
    a.resources :domain_themes, :controller => 'disguise/domain_themes'
  end
end