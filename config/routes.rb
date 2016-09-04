Rails.application.routes.draw do
	scope '/api' do
		resources :countries, :states, :cities, :categories

		resources :users do
			post 'favorited_events', on: :member
			post 'registered_events', on: :member
		end
	  resources :events do
	  	resources :activities, only: [ :index, :create, :destroy, :show ]
	  end
	end
end
