class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    logger.debug @tweets.count
  end

  def new 
    @tweet = Tweet.new
  end
  
  def create
    file = params[:tweet][:file].read
    @tweet = Tweet.new(file: file, message: params[:tweet][:message], tdate: Time.current, name: params[:tweet][:name])
    if @tweet.save
      flash[:notice] = '1件追加しました'
      redirect_to root_path
    else
      render new_tweet_path
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      flash[:notice] = '1件削除しました'
      redirect_to root_path
    else
      render destroy_tweet_path
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    file = params[:image][:file].read
    if tweet.update(message: params[:tweet][:message], name: params[:tweet][:name], file: file)
      flash[:notice] = '１件編集しました'
      redirect_to root_path
    else
      render edit_tweet_path
    end
  end
  
  def get_image
    image = Image.find(params[:id]) #↓詳細は説明を後述する
    send_data image.file, disposition: :inline, type: 'image/png'
  end
    
end