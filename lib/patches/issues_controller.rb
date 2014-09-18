module AssignToAnyUser
	module IssuesControllerPatch
		def self.included(base)
			base.send(:include, InstanceMethods)

			base.class_eval do
				before_filter :authorize, :except => [:index, :autocomplete_for_user]
				unloadable

				def autocomplete_for_user
					if params[:q].length > 0
						@users = User.active.sorted.like(params[:q]).limit(100).all
						render :layout => false
					else
						#render :nothing => true, :status => 200, :content_type => 'text/html'
						render_403
					end
				end
			end
		end

		module InstanceMethods
		end
	end
end

IssuesController.send(:include, AssignToAnyUser::IssuesControllerPatch)
