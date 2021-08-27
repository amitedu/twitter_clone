@if (current_user()->isNot($user))
    <form method="post" action="{{ route('follow', $user->username) }}">
        @csrf

        <button type="submit" class="rounded-full text-white shadow bg-blue-500 text-xs py-2 px-4 mt-2">
            {{ current_user()->following($user) ? 'Unfollow Me' : 'Follow Me' }}
        </button>
    </form>
@endif
