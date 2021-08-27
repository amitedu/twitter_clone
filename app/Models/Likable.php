<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Builder;

trait Likable
{
    public function scopeWithLikes(Builder $query)
    {
        $query->leftJoinSub(
            'select tweet_id, sum(liked) likes , sum(!liked) dislikes from likes group by tweet_id',
            'likes',
            'likes.tweet_id',
            'tweets.id'
        );
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }

    public function isDislikedBy(User $user)
    {
//        ddd($user->likes);
        return (bool) $user->likes
            ->where('tweet_id', $this->id)
            ->where('liked', FALSE)
            ->count();
    }

    public function like($user = NULL, $liked = TRUE)
    {
        $this->likes()->updateOrCreate([
            'user_id' => $user->id ?? auth()->id()
        ], [
            'liked' => $liked
        ]);
    }

    public function dislike($user = NULL)
    {
        return $this->like($user, FALSE);
    }

    public function isLikedBy(User $user)
    {
//        dd($user->likes);
        return (bool) $user->likes
            ->where('tweet_id', $this->id)
            ->where('liked', TRUE)
            ->count();
    }
}
