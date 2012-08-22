class PostsController < ApplicationController
  before_filter :require_login, :only => [:new, :edit]

  private
  def require_login
    unless session[:user_id]
       flash[:notice] = "You must be logged in to access this section"
       redirect_to request.referer 
    end
  end

  public
  

  def index
    logger.debug("index posts")

    if params[:user_id]
      @posts = Post.find(:all, :conditions => ['author_id = ?', params[:user_id]])
    else
      @posts = Post.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    logger.debug("show time")
    @post = Post.find(params[:id])
    @tags = @post.tags
    #@user = @post.author
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    logger.debug("Post")

    @post = Post.new
    @user = User.find(:first, :conditions => ['login = ?',session[:user_id]])

    #@post = @user.posts.build
    @tag = Tag.new

    logger.debug("user: "+@user.login)


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # POST /posts
  # POST /posts.xml
  def create
    #@post = Post.new(params[:post].delete('tags'))
    #@post = Post.new({:title => params[:post][:title], :content => params[:post][:content]})
    @post = Post.new(params[:post])
    @user = User.find(:first, :conditions => ['login = ?',session[:user_id]])

    #user management
    @post.author = @user
    
    # tags management
    if params[:tags]
      params[:tags].split(',').each { |tag|
        logger.debug("tag: " + tag.strip)
        tag = tag.strip
        if Tag.count(:conditions => {:name => tag}) == 0
          @tag=Tag.create(:name => tag)
        else
          @tag=Tag.find(:first, :conditions => {:name => tag.strip})
        end
        if @post.save
          @post.tags << @tag
          #@temp = @post.tags.build(@tag)
        else
          logger.debug("[error] in create post")
        end
      }
    end


    
    respond_to do |format|
      if @post and @tag
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def update
    @post = Post.find(params[:id])
    

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
