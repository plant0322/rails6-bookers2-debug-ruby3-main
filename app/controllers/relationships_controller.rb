class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    relation = Relationship.new(followed_id: user.id)
    relation.follower_id = current_user.id
    relation.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    relation = Relationship.find_by(followed_id: user.id)
    relation.follower_id = current_user.id
    relation.destroy
    redirect_to request.referer
  end

end
