<x-app-layout>

    @section('content')
        <header class="mb-6 relative">
            <div class="relative">
                <img src="/images/bugs_bunny.jpg" alt="" class="mb-2 rounded">
                <img
                    src="{{ $user->avatar }}" alt=""
                    class="mr-2 absolute rounded-full bottom-0 transform -translate-x-1/2 translate-y-1/2"
                    style="left: 50%"
                    width="150"
                >
            </div>
            <div class="flex justify-between items-center mb-6">
                <div style="max-width: 250px">
                    <h2 class="font-bold text-2xl mb-0">{{ $user->name }}</h2>
                    <p class="text-sm">Joined {{ $user->created_at->diffForHumans() }}</p>
                </div>
                <div class="flex">
                        @can ('edit', $user)
                            <a href="/profiles/{{ $user->username }}/edit"
                               class="rounded-full border border-gray-300 bg-white text-black text-xs py-2 px-4 mr-2 mt-2">
                                Edit Profile
                            </a>
                        @endcan
                    <x-follow-button :user="$user"></x-follow-button>
                </div>
            </div>
        </header>

        @include('_timeline', [
            'tweets' => $tweets
        ])

    @endsection

</x-app-layout>
