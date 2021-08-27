<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}" defer></script>
    </head>
    <body class="font-sans antialiased">
        <div class="min-h-screen bg-gray-100">
            @include('layouts.navigation')

            <!-- Page Heading -->
{{--            <header class="bg-white shadow">--}}
{{--                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">--}}
{{--                    {{ $header }}--}}
{{--                </div>--}}
{{--            </header>--}}

            <!-- Page Content -->
{{--            <main>--}}
{{--                {{ $slot }}--}}
{{--            </main>--}}

                <section class="px-8 py-4 mb-4">
                    <header class="container mx-auto">
                        <h2><img src="/images/logo.svg" alt="Tweety"></h2>
                    </header>
                </section>

                <section class="px-8">
                    <main class="container mx-auto">
                        <div class="md:flex lg:justify-between">
                            <div class="md:w-32">
                                @include('_sidebar-links')
                            </div>

                            <div class="md:flex-1 md:mx-10" style="max-width: 700px;">
                                @yield('content')
                            </div>

                            <div class="md:w-1/6 rounded-lg p-4">
                                @include('_friends-list')
                            </div>
                        </div>
                    </main>
                </section>

        </div>

    <script src="http://unpkg.com/turbolinks"></script>
    </body>
</html>
