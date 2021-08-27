<x-app-layout>
    @section('content')
        @foreach ($users as $user)
            <a class="flex items-center mb-4" href="/profiles/{{ $user->username }}">
                <div>
                    <img src="{{ $user->avatar }}" alt="{{ $user->username }}'s avatar" width="60" class="rounded mr-4">
                </div>
                <div>
                    <h4 class="font-bold">{{ '@' . $user->username }}</h4>
                </div>
            </a>
        @endforeach
    @endsection
</x-app-layout>
