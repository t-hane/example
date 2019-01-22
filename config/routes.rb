Rails.application.routes.draw do
  root to: redirect { Rails.application.routes.url_helpers.members_path }

  resources :members
  resources :tasks
end
