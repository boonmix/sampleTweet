class TweetMailer < ApplicationMailer
  
  def tweet_mail(tweet)
   @tweet = tweet

   mail to: tweet.user.email , subject: "ツイート確認メール"
  end
end
