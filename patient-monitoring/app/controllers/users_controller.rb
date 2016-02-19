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

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


	def destroy
  end

  def show
  	@user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
