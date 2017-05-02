class TweetsController < ApplicationController


  def index
    @tweet = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      @message = @tweet.post
      @image = File.expand_path(@tweet.image.file.file)
      @tweet = TwitterApi.send_tweet(@message,@image)
      flash[:success]= "New tweet successfuly created"
      redirect_to root_path
    else
      flash[:warning]= "New tweet isn't created"
      render 'new'
    end

  end
  private
  def tweet_params
    params.require(:tweet).permit(:post,:image,:remote_image_url,:name)
  end
end
