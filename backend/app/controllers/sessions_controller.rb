class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    @user = User.find_by_email user_params[:email]
    if @user&.valid_password? user_params[:password]
      sign_in @user, store: false
      render json: {
        message: "Signed in successfully",
        user: @user
      }, status: 200
      return
    end
    invalid_login_attempt
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :authentication_token
  end

  def invalid_login_attempt
    render json: { message: "Sign in failed" }, status: 401
  end

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    render json: { message: "Logged out." }
  end
end
