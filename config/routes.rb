Rails.application.routes.draw do
  namespace :admin do
    resource :theme, :controller => 'disguise/themes'
    resources :domain_themes, :controller => 'disguise/domain_themes'
  end
end