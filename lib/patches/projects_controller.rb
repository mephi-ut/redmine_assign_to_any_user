module AssignToAnyUser
	module ProjectsControllerPatch
		def self.included(base)
			base.send(:include, InstanceMethods)

			base.class_eval do
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

ProjectsController.send(:include, AssignToAnyUser::ProjectsControllerPatch)
