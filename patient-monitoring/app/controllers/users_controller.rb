class UsersController < ApplicationController
	
	def index
		if params[:query].present?
			@users = User.search(params[:query])
		else
			@users = User.all
		end
	end

	# def autocomplete
	# 	render json: User.search(params[:query], autocomplete: true, limit: 10).map(&:email)
	# end

	def search
		if params[:q].nil?
			@users = []
		else
			@users = Article.search params[:q]
		end
	end


	def destroy
  	end
end
