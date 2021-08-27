<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function show(User $user)
    {
        return view('profiles.show', [
            'user' => $user,
            'tweets' => $user->tweets()
                ->withLikes()
                ->paginate(50)
        ]);
    }

    public function edit(User $user)
    {
        return view('profiles.edit', compact('user'));
    }

    public function update(User $user)
    {
        $attributes = \request()->validate([
            'name' => ['string', 'required', 'max:255'],
            'username' => [
                'string',
                'required',
                'max:255',
                'alpha_dash',
                Rule::unique('users')->ignore($user),
            ],
            'avatar' => ['file'],
            'email' => [
                'string',
                'required',
                'max:255',
                Rule::unique('users')->ignore($user)
            ],
            'password' => ['string', 'required', 'min:6', 'max:12', 'confirmed']
        ]);

        if (\request('avatar')) {
            $attributes['avatar'] = \request('avatar')->store('avatars');
        }

        $user->update($attributes);

        return redirect(route('tweets'));
    }
}
