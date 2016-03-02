class UsersController < Clearance::UsersController
	def index
		@users = User.all.order(:id)
	end

	def update
		user = User.find(params[:id])

		if user.update(user_update_params)
			render :json => {}, status: :ok
		else
			render :json => {}, status: :bad_request
		end
	end

	private

	def user_update_params
		params.permit(:role, :status)
	end
end