# Core Agent

Some of the languages instrumented by Scout depend on a standalone binary for collecting and reporting data. We call this binary the Core Agent.

If the Core Agent is required for your language, the Scout agent library for that language will handle downloading, configuring, and launching the Core Agent automatically. However, you may manually manage the Core Agent through configuration options.

Builds of the Core Agent are available for these platforms and architectures:

Linux i686 (glibc)
Linux x86-64 (glibc)
Linux i686 (musl)
Linux x86-64 (musl)
OSX/Darwin x86-64



# Other languages

<aside class="notice">The Core Agent API is in our tech preview program.</aside>

Want to add tracing but Scout doesn't support your app's language? You can instrument just about anything (assuming you can communicate via a Unix Domain Socket) with Scout's [Core Agent API](https://github.com/scoutapp/core-agent-api). For information, view the [Core Agent API on GitHub](https://github.com/scoutapp/core-agent-api).