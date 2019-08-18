class UsersController < Frack::BaseController
  def index
    @users = User.all
    render('index', @users)
  end
end
