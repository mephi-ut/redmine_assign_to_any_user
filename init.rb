require 'redmine'

require_dependency 'patches/issues_controller.rb'
require_dependency 'patches/projects_controller.rb'

Redmine::Plugin.register :redmine_assign_to_any_user do
	name 'Redmine plugin to allow assigning an issue to any user'
	description 'A plugin to be able assign an issue to any user.'
	url 'https://github.com/mephi-ut/redmine_assign_to_any_user'
	author 'Dmitry Yu Okunev'
	author_url 'https://github.com/xaionaro'
	version '0.0.1'

	project_module :assign_to_any_user do
		permission :project_autocomplete_for_user, {:projects => [:autocomplete_for_user]}, :public => true, :read => true
		permission :issue_autocomplete_for_user,   {:issues   => [:autocomplete_for_user]}, :public => true, :read => true
	end
end

