class UsersController < Frack::BaseController
  def index
    @users = User.all
    render('index', @users)
  end

  def redirect
    redirect_to('users/index')
  end
end
