class UsersController < InheritsController
  def new
    @user = User.new
  end

  def create
    user_params[:email].downcase!

    existing_user = User.find_by_email user_params[:email]
    if existing_user
      flash.alert = 'Пользователь с таким email уже существует'
      render 'new'
      return
    end

    if user_params[:password] != user_params[:password_confirmation]
      flash.alert = 'Пароли не совпадают'
      render 'new'
      return
    end

    @user = User.new(user_params)
    if @user.save!
      @user.contact = Contact.new({name:@user.email})
      @user.contact.contact_data = ContactDatum.create({email:@user.email})
      session[:user_id] = @user.id
      redirect_to root_url, :notice => 'Добро пожаловать!'
    else
      flash.alert = 'Произошла ошибка сервера, вы не зарегистрированы :('
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :salt, :encrypted_password)
      #params.require(:user).permit(:email, :password_hash, :password_salt)
    end

end
