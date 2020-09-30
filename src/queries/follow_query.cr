class FollowQuery < Follow::BaseQuery

  def is_following(user, following_user)

    if user
      FollowQuery.new.follower_id(user.id).following_id(following_user.id).any?
    else
      # If there is no user (not logged in for example) it can't
      # follow anyone
      false
    end

  end

end
