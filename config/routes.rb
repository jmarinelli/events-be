Rails.application.routes.draw do
	scope '/api' do
		resources :countries, :states, :cities, :categories, :activities, :users
	  resources :events do
	  	resources :activities
	  end
	end
end
