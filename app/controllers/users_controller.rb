class UsersController < ApplicationController

  #before_filter :initial_set_objects, :excepts => [:index]

  private
  def initial_set_objects
    logger.debug("init")
    @user = User.new
  end

  public
  
  def session_management
    logger.debug("session_management")

  end

  
  def index
    logger.debug("index users")
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    logger.debug("show user")
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    logger.debug("Create a new user")
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # POST /users
  # POST /users.xml
  def create
    logger.debug("AAA " + params[:user][:password])

    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def update
    @user = User.find(params[:id])


    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'user was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end


  def subscriptions
    logger.debug("subscribe")
    @user = User.find(:user_id)

    respond_to do |format|
      format.html { redirect_to(request.referer, :notice => 'Added subscription.') }
    end
  end

end
