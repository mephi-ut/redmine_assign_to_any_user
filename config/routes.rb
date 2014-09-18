RedmineApp::Application.routes.draw do
	resources :projects do
		member do
			get 'autocomplete_for_user',	:to => 'projects#autocomplete_for_user'
		end
	end
	get 'issues/:id/autocomplete_for_user',		:to => 'issues#autocomplete_for_user'
end

