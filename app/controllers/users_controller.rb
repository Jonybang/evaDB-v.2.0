class UsersController < InheritsController
  def new
    @user = User.new
  end

  def create
    user_params[:email].downcase!
    @user = User.new(user_params)
    if @user.save!
      @user.contact = Contact.new({name:@user.email})
      @user.contact.contact_data = ContactDatum.create({email:@user.email})
      redirect_to log_in_url, :notice => 'Signed up!'
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
