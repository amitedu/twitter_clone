<div class="bg-gray-200 border border-gray-300 rounded-lg py-4 px-6">
    <h3 class="font-bold text-xl mb-4">Friends</h3>

    <ul>
        @forelse(auth()->user()->follows as $user)
            <li class="{{ $loop->last ? '' : 'mb-4' }}">
                <a
                    href="{{ route('profiles', $user) }}"
                    class="flex itmes-center text-sm"
                >
                    <img class="rounded-full mr-2" src="{{ $user->avatar }}" alt="" width="40px">
                    {{ $user->name }}
                </a>
            </li>
        @empty
            <li>No Friends Yet
            <li>
        @endforelse
    </ul>
</div>
