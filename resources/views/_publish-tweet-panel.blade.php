<div class="rounded-lg border border-blue-400 px-8 py-6 mb-4">
    <form method="POST" action="/tweets">
        @csrf

        <textarea
            name="body"
            class="w-full"
            placeholder="What's up doc?"
            style="border: none"
            required
            autofocus
        ></textarea>

        <hr class="my-4">

        <footer class="flex justify-between">
            <img
                class="rounded-full mr-2"
                src="{{ auth()->user()->avatar }}"
                alt=""
                width="40px"
            >
            <button
                type="submit"
                class="bg-blue-500 hover:bg-blue-600 rounded-lg shadow text-sm text-white py-2 px-2"
            >
                Publish
            </button>
        </footer>
    </form>
    @error('body')
        <p class="text-red-500 text-sm mt-2">{{ $message }}</p>
    @enderror
</div>
