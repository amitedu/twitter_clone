<div class="flex p-4 {{ $loop->last ? '' : 'border border-b-gray-400' }}">
    <div class="mr-2 flex-shrink-0">
        <a href="{{ route('profiles', $tweet->user) }}">
            <img class="rounded-full mr-2" src="{{ $tweet->user->avatar }}" alt="" width="40px">
        </a>
    </div>
    <div>
        <h5 class="font-bold mb-4"><a href="{{ route('profiles', $tweet->user) }}">{{ $tweet->user->name }}</a></h5>
        <p class="text-sm">{{ $tweet->body }}</p>

        <x-likes-button :tweet="$tweet"></x-likes-button>
    </div>
</div>
