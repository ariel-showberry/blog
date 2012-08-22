class TagsController < ApplicationController
  def index
    logger.debug("fdafdas")
    if params[:post_id] && Post.exists?(params[:post_id])
      @tags = Post.find(params[:post_id]).tags
     else
      @tags = Tag.all
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    logger.debug("show time")
    #@tag = Tag.find(:conditions => {:name => params[:id]})
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end


  def subscribe
    logger.debug("subscribe")
    @user = User.find(:first, :conditions => ['login = ?',session[:user_id]])
    @tag = Tag.find(params[:id])

    @user.subscriptions << @tag
    @tag.subscribers << @user

    respond_to do |format|
      format.html { redirect_to(request.referer, :notice => 'Added subscription.') }
    end
  end

end
