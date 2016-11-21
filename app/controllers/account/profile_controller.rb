class Account::ProfileController < Account::AccountController
  def index
    @user = current_user
  end
  def create
    @user = current_user
    @user.update_attributes(user_params)

    render template: "/account/profile/index"
  end
  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
