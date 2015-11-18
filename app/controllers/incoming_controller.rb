class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @body = params["body-plain"]

    if @topic == nil
      @topic = Topic.create!(title: params[:subject], user_id: @user.id)
    end

    @body.scan(/(https?:\/\/[\S]+)/) do |url|
      Bookmark.create!(url: url.first, topic_id: @topic.id)      
    end

    head 200
  end
end