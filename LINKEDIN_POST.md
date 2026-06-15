# LinkedIn Post — IronLog

---

Three months of continuous work. Two weeks of testing. Still a bunch of bugs. But the core of it actually works — and that core is something I wasn't sure was possible on a phone six months ago.

I built **IronLog** — a gym tracker where every single piece of intelligence runs on-device, powered entirely by **Google's Gemma 4 E2B**.

Not "AI-assisted." Not a thin wrapper around a cloud API. The actual model — 2 billion parameters, INT4 quantized, about 1.1 GB — lives on the phone and runs locally through MediaPipe's LLM Inference API. No server. No subscription. No request leaves the device.

Here's what that looks like in practice:

You speak or type your workout — *"bench press 3 sets of 8 at 225 pounds"* — and Gemma parses it. Not regex, not a lookup table — the actual language model understands what you said, extracts the exercise, sets, reps, and weight, and logs it. On a mid-range Snapdragon 7s Gen 3, that parse completes in under 3 seconds. After your session, Gemma generates a coaching insight based on your volume trends and goal — under 6 seconds. If a muscle group's weekly volume jumped more than 15% over the previous week, Gemma writes the safety warning too.

The model is GPU-accelerated on Adreno via MediaPipe's Vulkan/OpenCL path, with CPU fallback for unsupported hardware. Everything gracefully degrades — if the model isn't loaded, regex parsers and template-based insights keep the app functional.

What pushed this project was a question I kept coming back to: why does "AI" in fitness apps almost always mean someone else's server reading your data? Edge inference has gotten genuinely good. Gemma 4 E2B is a real model doing real work. It deserved to be used seriously.

A few other things worth noting:

**Volume = Sets × Reps × Weight.** That's the only progression metric. No 1-rep max estimates anywhere in the codebase — not in the UI, not in the database, not in the AI prompts. It's the most directly measurable signal for hypertrophy and I didn't want anything muddying it.

**The app works in airplane mode.** All of it. Firebase handles Google Sign-In and optional SQLite backups, but if you never connect to the internet, every feature — AI parsing, coaching, charts, history, planning — still works. Offline-first was an architectural constraint, not a bullet point.

The stack is Flutter 3.38, Riverpod 3 with codegen, Drift for type-safe reactive SQLite, and fl_chart for analytics. It's open source — link below. There's still a lot left to do and more bugs than I'd like to admit, but getting Gemma running reliably on-device and delivering sub-3-second inference was the hard part, and that's working.

If you're doing anything with on-device LLMs, MediaPipe, or edge AI on mobile — I'd genuinely love to compare notes.

🔗 github.com/Redsu1951/ironlog

#OnDeviceAI #Gemma #Flutter #Android #EdgeInference #MediaPipe #OpenSource #MobileML #Dart
