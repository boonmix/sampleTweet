class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy, :show]
  before_action :login, only: [:new, :show, :edit]
  
  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)##下記のコメントNo.1に定義されてる。
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id=current_user.id
      if @tweet.save
        redirect_to tweets_path
      else
        render 'new'
      end
   end
  
  
  def edit
  end

  def update
      if @tweet.update(tweet_params)
        redirect_to tweets_path
      end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
  
  def show
    @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
  end
  
  def confirm
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id=current_user.id  
    render :new if @tweet.invalid?
  end

  private
    def tweet_params##No.1
      params.require(:tweet).permit(:content)
    end
    
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
    def login
    if !logged_in?
      redirect_to new_session_path
    end
    end
    
 end
