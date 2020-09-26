class FollowProfile < Follow::SaveOperation
  permit_columns following_id, follower_id
end
