+++
title = "Random Word API"
description = "Dictionary restful API returning a random word. Learning project and demo."
weight = 10
date = 2025-10-10

[taxonomies]
tags = ["rust","restful api"]

[extra]
toc = true
local_image = "projects/random-word-api/noun-7325919.svg"
invertible_image = true
canonical_url = "https://funzen.xyz/projects/random-word-api"
+++

## Premise

Four years ago, I learned frontend development and I really wanted a career with
[Elm](https://elm-lang.org/)[^1]. You can read more about this in
[My Rust Story](/blog/my-rust-story/#learning-web-development) blogpost. At the
time, I made a little demo for junior job interviews. A
[Speak and Spell](https://codeberg.org/andreacfromtheapp/elm_speakandspell)
_clone_. It used [an API](https://github.com/mcnaveen/random-words-api) that
closed the spigot (presumably costs?). This is to say that, when I needed an
itch to learn restful API development, I had a hole to fill in and somewhere to
start from.

To keep this summary of my learning brief, I've only reported the main points to
highlight the reasoning behind the process; rather than using a lengthy bullet
point list. A technical learning summary is available in the
[Random Word API repository](https://codeberg.org/andreacfromtheapp/random-word-api)
README file. I hope you like it as much as I loved learning with this project!
❤️🦀

## What This Is

A [restful API](https://restfulapi.net/) built with
[Axum](https://github.com/tokio-rs/axum) in Rust and a personal project to dive
deep into web service development. A simple, straightforward showcase of
technical skill and learning – built to demonstrate capability at job
interviews. Because I really want a career with Rust. As per premise: this API
was primarily designed to support my Speak and Spell clone. Then, it evolved
into a comprehensive learning experience.

## Demo It

You can ~~check [the demo](https://word-api-axum.netlify.app/)~~, browse the
[source code](https://codeberg.org/andreacfromtheapp/random-word-api), and
[run it with Docker](https://codeberg.org/andreacfromtheapp/random-word-api?tab=readme-ov-file#docker-compose).

~~Note that the free tier I'm using shuts down after some time of inactivity or
stop serving entirely if quota is reached. You may experience slow loading times
or no demo at all. In the latter case, you could run the demo in Docker. My
apologies.~~

## KISS

I knew I needed to devise the same model and response of the OG API, as a
starting point, so I could use my existing app as a _real world scenario_ to
test against. The OG API used a very small response. I treated it as a black box
to reverse engineer. A methodology I find best suited for learning[^2]: it
forces one to _think hard_ while offering a safety net. Thus, I started from the
response I was
[already decoding in Elm](https://codeberg.org/andreacfromtheapp/elm_speakandspell/src/branch/main/src/elm/SpeakAndSpell.elm#L202-L207):

```json
<!-- An actual response from my Random Word API -->
[
  {
    "word": "unknown",
    "definition": "not known or identified",
    "pronunciation": "/ʌnˈnoʊn/"
  }
]
```

## The Database

I chose to use SQLite. It still offered good learning opportunities, both for
the API and Rust tooling, so I was happy with going down this path. In
preparation for the demo, it also meant running one less service (PostgreSQL) I
can't afford at the moment.

The OG API adopted data in JSON files. That could have been easier to implement,
but what would have given in terms of learning? Moreover, I like SQL. I'll take
SQL and rely on [SQLx](https://crates.io/crates/sqlx) guarantees over learning
and using ORMs[^3], any day of the week!

## Beyond the Basics

The model, simple by design, fulfilled all app's requirements and it allowed for
a broader learning scope. Once I had an
[MVP](https://en.wikipedia.org/wiki/Minimum_viable_product) in place, I sought
to learn and to implement more. I stumbled upon two great resources that
provided guidance and ideas: [https://restfulapi.net/](https://restfulapi.net/)
and [https://rust-api.dev/](https://rust-api.dev/). Besides, I recalled that the
OG API, had these weird `@swagger` comments: "_what are these!? - Put a pin on
them_".

All great pointers I wanted to delve deep into. To extend my learning and
improve my API:
[middleware pattern](https://rust-api.dev/docs/part-1/tokio-hyper-axum/#the-middleware-pattern),
authentication, authorization,
[JWT token](https://www.jwt.io/introduction#what-is-json-web-token),
[OWASP](https://owasp.org/www-project-secure-headers/) OHSP recommendations, and
[OpenAPI](https://www.openapis.org/) documentation. Besides
[everything else](https://codeberg.org/andreacfromtheapp/random-word-api?tab=readme-ov-file#technical-learning-summary).

## Iterate Iterate Iterate

In an iterative process, I refactored the code and added more features. I.e:
enabling grammatical types endpoints. I future-proofed the API to accommodate
additional languages with minimal efforts. This may seem like a pointless
exercise for an API this simple with no real use, however, it was as valuable to
my learning as best practices and design patterns. It also demonstrates a
forward-thinking attitude and a meticulous approach to projects. I suppose these
are good things. Right!? 🖖🫣

## Conclusion

All things considered, I'm very happy with this learning journey. Starting from
a known with simple requirements was a great choice. Especially for a _curious
as a cat always longing to know more_ person like I am. Moreover, the
[simple model](https://corrode.dev/blog/simple/) opened up a plethora of
possibilities beyond the MVP. _Is this enough!?_ Nah. _Can I call myself a
backend developer?_ This was the first step towards it and I'm way more
confident and knowledgeable than when I started this project. So, final verdict:
HELL YEAH! 🤟

## Disclaimers

I have sometime relied on Claude via
[Amazon Q CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) for
_boring_ and repetitive stuff.

I prompt engineered
[rustdoc](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html),
[utoipa](https://crates.io/crates/utoipa) documentation, and both testing
suites.

As my first API, I modeled the MVP on
[Code Like a Pro in Rust](https://www.manning.com/books/code-like-a-pro-in-rust)
API chapter.

## Credits

[Translation image by Kawalan](https://thenounproject.com/icon/translation-7325919/)
from Noun Project used under CC BY 3.0.

---

[^1]:
    I'm sure you are aware of
    [Elm influence](https://elm-lang.org/news/compiler-errors-for-humans) on the
    [Rust compiler error messages](https://blog.rust-lang.org/2016/08/10/Shape-of-errors-to-come/).
    And on many Rust [Web](https://yew.rs/), [GUI](https://iced.rs/),
    [TUI](https://ratatui.rs/concepts/application-patterns/the-elm-architecture/),
    and [App](https://red-badger.com/crux) frameworks.

[^2]:
    Truth be told, as this is my first API, I also relied on
    [Code Like a Pro in Rust](https://www.manning.com/books/code-like-a-pro-in-rust),
    which I had previously studied and modeled my initial design on its API
    chapter.

[^3]:
    Learning many ORMs, one or more for each language one uses, over just
    learning SQL? That also grants you database skills!? Nah.
