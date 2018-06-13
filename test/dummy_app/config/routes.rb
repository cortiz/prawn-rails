Dummy::Application.routes.draw do
  resources :products

  get "reports/sample"
end
