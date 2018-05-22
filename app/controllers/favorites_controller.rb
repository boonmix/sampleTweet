class FavoritesController < ApplicationController
  
  
  def index
   @favorites_tweets = current_user.favorite_tweets
  end
  
  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(tweet_id: params[:tweet_id]).destroy
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのブログをお気に入り解除しました"
  end
end