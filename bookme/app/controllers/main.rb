Bookme::App.controllers :main do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  before do
    content_type :json
  end
  
  # GET /main
  get :index do
    @data = Bookmark.all

    render 'bookmark/index'
  end

  # GET: /main/show/1
  get :show, :with => :id do
    id = params[:id].to_i
    @data = Bookmark.find(id)

    render 'bookmark/show'
  end

  # GET: /main/preview
  get :preview do
    halt 400, 'Not implemented'
  end

end
