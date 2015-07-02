class UsersController < InheritsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.contact = Contact.new({email:@user.email})
    if @user.save
      redirect_to root_url, :notice => 'Signed up!'
    else
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:email, :password, :salt, :encrypted_password)
      #params.require(:user).permit(:email, :password_hash, :password_salt)
    end

end
