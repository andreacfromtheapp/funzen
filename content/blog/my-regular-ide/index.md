+++
title="rIDE: a composable non-IDE for terminal junkies"
date="2025-10-20"
updated="2026-01-27"

[taxonomies]
tags = ["rust", "software engineering", "faq", "ide", "helix editor"]

[extra]
toc = true
quick_navigation_buttons = true
+++

## Premise

This is just my opinion and a very subjective affair. YMMV. I express
preferences that may not match yours. And that's fine. I neither pretend nor
imply to lay down this as a paper nor as a definitive solution for everyone.
There's nothing scientific about this. Paraphrasing a Grace Jones
[song](https://open.spotify.com/track/1NN9UaLVAKq4ADId81JgUK): _this is not
perfect, but it's perfect for me_.

That being said, I'm passionate and I like sharing things I believe have merits
and could benefit others. This is the spirit you should keep in mind, while
reading this.

## Credits

I first heard of non-IDE in [a Zed video](https://youtu.be/5tK-Y0kn_zE). That
made me realize I was _assembling a non-IDE_. I had recently switched to Helix.
I decided to name it `rIDE` and to blog about it, there and then. I believe they
deserves credits for inspiring this blogpost.

## The Elevator Pitch

I've used _every text editor under the Sun_[^1] and I've
[_editor hopped_](https://en.wiktionary.org/wiki/distro-hopping) for years,
while sticking with (n)vim, looking for the _perfect IDE_. One that would fit my
needs and tick all checkboxes[^2]. Until I heard about
[Helix Editor](https://helix-editor.com/) and decided to give it a go. Helix is
fast. It's modal. It's featureful. It requires no maintenance. It supports all I
need. The learning curve and switching costs were minimal. I never looked back.

Helix, despite the name, [is an IDE](https://www.youtube.com/embed/HcuDmSb-JBU).
However, it doesn't have - to name a few - a file manager, a terminal emulator,
nor git porcelain. By design. Helix's focus is to offer core IDE features - no
more[^3] - out of the box. A choice akin to the
[UNIX philosophy](https://en.wikipedia.org/wiki/Unix_philosophy). One that other
editors users may find limiting or lacking. On the other hand, it's an approach
that enables _comprehensive modularity_, which is `rIDE`[^4] core principle.

`rIDE`, simply put, is: use the best tool for the job. Each with its own
configuration[^5]. Easy to integrate with Helix. Easy to replace, when you want
to swap a specific tool for another. All within your favorite terminal emulator.
Live happily ever after. 🥳 🎉

Having to compose external tooling may seem unnecessary extra-work, at first. I
thought so too, after some usage and when pondering the switch. It didn't take
me too long to accustom to this new normal, though. Which is comparable, for the
most part, to using extensions. That said, the perks of the `rIDE` approach are
numerous. Most importantly: a level of flexibility and peace of mind I haven't
had in a long time.

## The Full Story

### Holy Wars

In my early days of involvement and falling in love with Copyleft[^6], I've
ideologically been closer to [FSF](https://www.fsf.org/) than
[OSI](https://opensource.org/)[^7]. Thus, for reasons as silly as the
[editor war](https://en.wikipedia.org/wiki/Editor_war), I was tempted to join
_The Church of Emacs_. Although, as I was looking into a Linux
[System Administrator](https://en.wikipedia.org/wiki/System_administrator)
career, I made a pragmatic choice. Systems shipped vi(m). Thus, I learned vi(m)
and extensively used (n)vim - vanilla, custom, with plugin managers, or
distros - for about 20 years. It would still be my backup editor, should the
need arise.

### Terminal Mon Amour

As system administrators do, I live(d) in the terminal (with or without a
multiplexer). The terminal is my preferred environment. When feasible and
reasonable, I rely on and prefer terminal applications. Not a brag. It's
relevant for later. Put a pin on this 📍

### GUIsclaimer

Later, I'll get into some of the editors I explored and used for a varying
amount of time and degree of satisfaction. Some of them are graphical. A common
issue I have with graphical editors: they slow me down. In this context, GUIs
are distracting. I often have found myself fighting them and having to think
about most interactions.

### It's Not You, It's Me

(n)vim is a great modal editor I love(d). It became second nature to me, and
it's the one I've always went back to during my editor hopping explorations.
That being said, personal pain points motivated me to seek out alternatives.
Lately, more intensely.

### Every Text Editor Under The Sun

Amongst the many I explored[^1], whilst still using (n)vim[^8] as my `GOTO` and
fallback, the three _alt-editors_ shortlist, for _features-related merits_,
comes down to:

- VS Code: supports basically everything; Live Share / pair programming tooling.
- DOOM Emacs: the meta key; _the bottom drawer_; which-key; the pickers; ease of
  configuration; one stop shop. Org Mode / Roam / Agenda. The list could go
  on[^9].
- Zed: fast; written in Rust; native AI integration; great communication
  tooling.

These are some of the features I wished a _definitive editor_ would pack in by
default. The single most important of the list - can you tell!? 😜 - is,
arguably, DOOM Emacs. Lazyvim also plays a major role, when it comes to features
set. We'll get to them next.

### Not So Unique, Pal

Nowadays, the most widely used editors all share many features. Influencing and
inspiring each others. Thank
[Ceiling Cat](https://knowyourmeme.com/memes/ceiling-cat) for Open Source!
Nothing I'm about to say next is intended as unique to, nor distinguishing for,
any particular editor. Helix is, however, the main subject of this whole story;
and it's used as basis of comparison.

### So Many Checkboxes

While Helix didn't implement all the desired features, it ticked enough
checkboxes to convince me that it was worth sticking with it. To make the
switch. To get used to it. Only then, ponder how to _fill in the blanks_. In no
particular order, they all rock:

- [Modal](<https://en.wikipedia.org/wiki/Mode_(user_interface)>) text editor ✅
- [Terminal](https://en.wikipedia.org/wiki/Terminal_emulator) based ✅
- [Written in Rust](https://corrode.dev/blog/foundational-software/) ✅
- [Blazingly fast](https://youtu.be/4YU_r70yGjQ) ✅[^10]
- [Core IDE features out of the box](https://www.youtube.com/embed/HcuDmSb-JBU)
  ✅
- Great
  [support for languages and tools](https://docs.helix-editor.com/lang-support.html)
  I care about ✅
- Minimal [configuration](https://docs.helix-editor.com/configuration.html) and
  maintenance ✅
- Great support for a [keyboard-only](https://youtu.be/dg2TT1OJlQs) workflow ✅
- Minimal learning curve and switching costs ✅

To me, these clearly were solid foundations I could build upon, at a later
stage. 🍾 🎊

### So Many Blanks To Fill In

Alas, early on in the switch, it still felt like Helix missed important bits I
was used to. Let's address the elephant in the room: how was I gonna fare
without Vim's mode and editing approach? _Action first_ vs _Selection first_?
Surely, the filliest elephant to filly-fill.

And what about tooling? Helix doesn’t have, to name a few: extensions[^3] nor
package managers, a file manager, a terminal emulator, nor git porcelain. _What
you mean I have to install things externally?_ _Can I easily integrate Lazygit?_
So on and so forth.

The blanks didn't end there either. What about what's left from the earlier
shortlist?

## The Meat Of The Tomato

Before discussing how to _fill in the blanks_ and develop the `rIDE`[^4]
_concept_, let's first expand on the checkboxes. Hereby grouped by their common
characteristics. You should consider each of them as something absolutely
indispensable, in this context.

### Modal and terminal based text editor

Being accustomed to (n)vim, with a long-serving experience, and
[suffering graphical text editors](#guisclaimer), the _perfect editor_ had to be
both modal and run in my favorite terminal.

### Written in Rust. Fast and Featureful

I love Rust for [personal](/blog/my-rust-story/#software-engineering-with-rust),
[technical](https://youtu.be/nOSxuaDgl3s), and
[social](https://rust-lang.org/policies/code-of-conduct/) reasons. You may love
Zig (I'm _Zig-curious_), Go, or C++. For different reasons. That's absolutely
fine. As you'll see in the next section, when we'll get to `rIDE`, I do tend to
go all-in but I'm not a maximalist.

There are more specific points of the utmost importance - besides, of course,
the responsiveness of executables built with it - in wanting the _perfect
editor_ to be written in Rust. I.e: its guarantees - like memory safety and
error handling - and [its language design](https://youtu.be/k_-6KI3m31M). These
may seem frivolous reasons but there's a common thread: I'm not willing to cope
with entire categories of bugs and annoyances, if I can help it.

This leads into the last point: extensions vs
[core IDE features out of the box](https://www.youtube.com/embed/HcuDmSb-JBU).
In this case, less is more. Specifically, less dependencies and things that can
go wrong or that I have to manage. While no language is immune to supply chain
attacks, this to me - I may be wrong, of course - feels like having a smaller
attack surface, overall.

### Support for languages and tools

While Helix bakes in plenty
[core IDE features by default](https://www.youtube.com/embed/HcuDmSb-JBU), to
[support languages](https://docs.helix-editor.com/lang-support.html) it relies
on [LSP](https://en.wikipedia.org/wiki/Language_Server_Protocol),
[Tree-sitter](https://tree-sitter.github.io/tree-sitter/), and external tooling.
Such as language servers and, for example, external formatters. This is, of
course, common to other editors and pretty much the standard. With a difference:
most editors rely on package managers (or extensions) to install them. With
Helix, one is required to install external tooling. Initially, this seemed a
nuisance and a _bug_. It soon turned into a welcome _feature_. This was also the
moment where _modularity as a plus_ bubbled up my neural paths.

### Minimal configuration and maintenance

(n)vim configurations can
[get out of hand](https://www.youtube.com/watch?v=AS7mnDgFgnw&t=117s) and turn
into a PITA. Even an expert[^11] admits not touching it for a year; that must
mean something. Distributions like Lazyvim (or DOOM Emacs) may do a great job at
handling and hiding them for end users, however, this was still too high
maintenance and my main paint point with it.

On the other hand, Helix comes with great defaults and only has two main TOML
[configuration files](https://docs.helix-editor.com/configuration.html). One for
the editor. One for customizing languages support. Needing to tweak the editor
settings or languages support is, pretty much, _set and forget_. Something that
doesn't happen that often either. Mostly when swapping tools.

### Support for a keyboard-only workflow

Arguably, this is the most subjective preference of the checkboxes. It does,
however, tie in with [my difficulties with graphical editors](#guisclaimer).
Moerover, it is a preference shared by most - if not all - terminal text editors
users. Nonetheless, this is worth mentioning because Helix's
[_selection first editing_](https://docs.helix-editor.com/usage.html#selection-first-editing)
works amazingly for a mouseless workflow.

Here's the kicker: even more so than (n)vim's _action first_ approach.
_"HERESY!!!"_

As greatly stressed in this whole story, I've been using (n)vim for the best
part of two decades. I enabled _Vim Mode_ everywhere I could. This obviously was
a huge blank to fill in. Unlike others, however, I neither think Helix made a
bad design choice nor
[seek out an evil-mode](https://github.com/usagi-flow/evil-helix). Like I
previously did by choosing DOOM Emacs over vanilla. This time, I wanted to see
if it was worth making the switch. To get used to it. I love it.

### Minimal learning curve and switching costs

The cat is out of the bag. The learning curve and switching costs mainly
comprised the editing style: `selection →  action model` vs
`action →  selection model`. Other differences were negligible enough. Missing
features and tools? Easy to deal with. Moreover, exploring so many editors
widened my perspectives. Adjusting to Helix mode, pickers, commands, and
shortcuts, was never an issue in the first place.

## So, What Is rIDE?

By now, it should be clear that `rIDE` is _nothing new under the Sun_. The
non-IDE concept pre-dates it. What it is, is my own approach to it and a funny -
inside joke[^4] - name; and, of course, a tooling set of choice. To wit, there
are _distros_ for Helix too. Like
[Yazelix](https://github.com/luccahuguet/yazelix). This is something I looked up
and gave it a miss. I was not going down that path again. No thanks. It would
have meant picking a different distro lock-in, configuration-hell, and someone
else's (often maximalist) restrictive choices.

Let's start from what Helix does not feature by design, and compare my choices
and differences with Yazelix. The most important is definitely the terminal
emulator. This is where everything runs, after all. I made a different choice,
for a few key reasons.

### Ghostty

Most Rust _aficionados_ run with [WezTerm](https://wezterm.org/index.html). I
did to, until I heard about [Ghostty](https://ghostty.org/). Yazelix (and most
people using WezTerm) relies on [Zellij](https://zellij.dev/) to multiplex and
resemble an IDE layout to run Helix and other tools. Whatever floats their
boats. I did try the Zellij approach to run Helix on my own and it felt like
[a GUI editor all over again](#guisclaimer). 😱

Ghostty has many other great qualities that made me prefer it. Above all, it
behaves natively on all platforms. Using the same keystrokes and macros on my
[ZSA Voyager](https://youtu.be/dg2TT1OJlQs) (with
[Colemak DHm](https://colemakmods.github.io/mod-dh/)) in all of my terminal
based environment is a huge plus. Besides, Ghostty ships with clever split
functionality and great tabs management.

Final note on Zellij: I'd still use it in lieu of tmux for multiplexing tasks on
a daily basis. Until: Ghostty delivers on
[its promise to revolutionize multiplexing](https://youtu.be/o-qtso47ECk) as
well. When it will eventually be implemented, this feature will certainly spawn
a number of tools and pave the road for wide open possibilities. I look forward
to it to have _native_ remote pair programming, sessions sharing, and
communication integration. For the time being, I would like to try out
[Team Type](https://teamtype.github.io/teamtype/) and see how that works out.

### Fish Shell and Starship

As an ex-system-administrator,
[the CLI is my preferred habitat](#terminal-mon-amour). I don't need a
[non-POSIX](https://en.wikipedia.org/wiki/POSIX)
[fancy shell trying too hard](https://www.nushell.sh/). I extensively used BASH
and Zsh. So, lately, I've switched to [Fish](https://fishshell.com/) and
[Starship](https://starship.rs/) for QoL improvements. That's plenty already.

### Helix, of Course

This should go without saying, however, it's worth mentioning for a reason:
running a terminal emulator within a terminal text editor (within a terminal
multiplexer) within a terminal emulator seems too convoluted and inefficient.
Especially if you can just run Helix in a Ghostty tab, and rely on the latter
for terminal tabs or splits for any task you'd run in a terminal. And that's it.
_Missing feature_?! Quite the contrary.

### Yazi and Lazygit

Let's address the other two _missing features_: the file manager and git
porcelain. Yazelix name is a portmanteau of [Yazi](https://yazi-rs.github.io/)
and Helix. Yazi is a great TUI file manager. I do have it installed but rarely
use it. I navigate the filesystem in the terminal when I need to. From there I
open what's needed, directly in Helix. Should I need to open more files, I rely
on Helix file picker and fuzzy find.
[Lazygit](https://github.com/jesseduffield/lazygit)? I constantly rely on it.

All it takes to integrate both with Helix - provided one has previously
installed them - is just to add two lines to `~/.config/helix/config.toml` to
map them as pleased:

```toml
[keys.normal]
C-g = [":new", ":insert-output lazygit", ":buffer-close!", ":redraw"]
A-f = [":new", ":insert-output yazi", ":buffer-close!", ":redraw"]
```

Side note: if you prefer [Magit](https://magit.vc/), give
[gitu](https://github.com/altsem/gitu) a try. Wanna use
[GitUI](https://github.com/gitui-org/gitui/) instead? No problem! Just replace
the name of the binary in that specific one liner! Easy peasy!

### Catppuccin

This is subjective, of course, but all it takes to theme Helix - and
[all of `rIDE`](https://catppuccin.com/ports/) - is to choose or install a theme
and add a one liner to `~/.config/helix/config.toml`:

```toml
theme = "catppuccin_macchiato"
```

### Kiro CLI

I don't rely on AI too often and don't subscribe to _vibe coding_ (at all!),
however, when using Zed I tried out AI and it was useful to some extent[^12]. I
went from _fully skeptic_ to _cautious user_ and I still agree with most
criticisms. Especially with the argument about _AI in the hands of a
knowledgeable user vs a cheap lazy sod_. I do like to use
[Claude Sonnet](https://claude.ai) with [Kiro CLI](https://kiro.dev/cli/) for
small, boring, and repetitive stuff; or when I struggle with an issue for too
long and can't understand it/find my own solution.[^13]

### Harper and Codebook

For grammar checks and typos avoidance, [Harper](https://writewithharper.com/)
and [Codebook](https://github.com/blopker/codebook) are great.

### Typst

There's one last missing desired tool from
[editors shortlist](#every-text-editor-under-the-sun) to talk about:
[Org Mode](https://orgmode.org/). When I used DOOM Emacs as my daily driver, I
fell in love with Org Mode. Its features set allows for great documents;
especially with
[LaTeX export](https://orgmode.org/worg/org-tutorials/org-latex-export.html) to
anything. I wanted to migrate all my writings to it and even replace
LibreOffice. That's how powerful it is. When I left DOOM Emacs behind, I
switched to Zed and [Obsidian](https://obsidian.md/).

To wit: 1) Obsidian is OK; 2) I've since fantasized with the idea to create an
office suite with Org Mode as its engine, in Rust. So, I sought out and found
some ports and libraries but a) they don't have features parity and b) I'm not
that good (yet?!).

And then one day, I stumbled upon [Typst](https://typst.app/). They do a
fantastic job indeed. So now, I'm thinking to migrate _everything writing_ to it
instead. At the moment I'm only using the web app to manage my CV with it. That
being said, Typst engine is written in Rust and it's Open Source. Anyway,
momentarily I'd be content with using Typst with Helix for my writings. Guess
what: Helix supports it out of the box or with minimal tweaks.

```toml
[language-server.harper-ls]
command = "harper-ls"
args = ["--stdio"]

[language-server.codebook]
args = ["serve"]
command = "codebook-lsp"

[language-server.tinymist]
command = "tinymist"

[[language]]
name = "typst"
language-servers = ["tinymist", "harper-ls", "codebook"]
formatter = { command = "typstyle" }
auto-format = true
```

### Markdown Oxide

While Typst would work great to replace _everything writing_, I'd still like to
rely on [Markdown Oxide](https://oxide.md) for
[PKMS](https://en.wikipedia.org/wiki/Personal_knowledge_management). I've been
fascinated by [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) and
[Org Roam](https://www.orgroam.com/), for a while. However, I never went farther
than using [The Archive](https://zettelkasten.de/the-archive/) app for my
creative writings; then replaced by Obsidian. Mostly because Obsidian offers a
mobile app with sync. I'd like to ditch Obsidian in favor of a _full Helix
experience_, though.

Helix easily supports Markdown Oxide - install it and add a few lines. To avoid
conflicts with my global settings, I rely on Helix local settings and a _on
demand_ bespoke [Nix Flake](https://wiki.nixos.org/wiki/Flakes):

```nix
{
  description = "PKMS environment with Markdown Oxide";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            name = "oxide-pkms";

            buildInputs = with pkgs; [
              harper
              codebook
              markdown-oxide
              mpls
              starship
            ];

            shellHook = ''
              eval "$(starship init bash)"

              # Create .helix directory and manage the local languages.toml
              mkdir -p .helix

              cat > .helix/languages.toml <<- EOF
              [language-server.harper-ls]
              command = "harper-ls"
              args = ["--stdio"]

              [language-server.codebook]
              command = "codebook-lsp"
              args = ["serve"]

              [language-server.mpls]
              command="mpls"
              args = [
                "--browser",
                "duckduckgo",
                "--no-auto",
                "--full-sync",
                "--enable-emoji",
                "--enable-footnotes",
                "--code-style",
                "catppuccin-macchiato",
              ]

              [[language]]
              name = "markdown"
              language-servers = ["markdown-oxide", "harper-ls", "codebook", "mpls"]
              auto-format = true
              EOF

              cat <<- EOF

              PKMS environment with https://oxide.md

              EOF
            '';
          };
        };
    };
}
```

### You Get the Gist

I could go on about Helix languages support and how to configure them, or about
adding more tooling to `rIDE`, but that would be pointless. In sharing all this,
I just wanted to counter frequent criticisms and exemplify _my idea_ to give
meaning to it all. If you like the _concept of a modular IDE_, hereby presented
as _rIDE_, the sky is the limit. Whether you do or don't, I'd like to invite you
to try out Helix, if you please:

- [Helix Documentation](https://docs.helix-editor.com/)
- [Helix Tutorial](https://helix-editor.vercel.app/start-here/basics)
- [Helix Golf](https://nik-rev.github.io/helix-golf/)
- [Helix Editor Tutorial Series](https://youtube.com/playlist?list=PL4AR7tbGuBH5AzV0tPpTfYgGIF5vk3HN2)

Thank you so much for your time, I appreciate you.

🍻🚌

---

[^1]:
    A non-exhaustive and non-chronological list of the ones I do remember
    exploring: Gedit. BBEdit. Notepad++. TextMate. Sublime. Atom. VS Code. Zed.
    Rust Rover. DOOM Emacs. Possibly more, but probably not worth recalling.

[^2]:
    During my explorations, I always missed (n)vim - not the pain points that
    made me look for others in the first place, though - and always came back to
    it. Having said that, I really liked some of the features of some of the
    other editors too. This made me long for an editor that would _Frankenstein_
    those into a single package.

[^3]:
    If you are wondering: yes, Helix
    [will eventually be extensible with plugins](https://github.com/helix-editor/helix/discussions/3806) -
    should you need those. However, this would not mean that Helix will distort
    its core philosophy.

[^4]:
    The `r` in `rIDE` stands for _Regular_. It is both an inside joke for
    [Ken](https://wfmu.org/playlists/KF)'s listeners and a play on the fact that
    it's technically not an IDE. Let alone a _regular one_.

[^5]:
    As opposed to having a humongous (n)vim configuration you have to schedule
    maintenance for; one would install and configure external tooling
    independently from Helix. We'll get into this, when expanding on rIDE, much
    later.

[^6]:
    Care to read
    [_My Linux Story or: How I Fell in Love with Copyleft and Revolution_](/blog/my-linux-story/)?

[^7]:
    There are pretty good arguments to be made. I'll blog about this too,
    soon-ish.

[^8]:
    With custom configurations and / or plugins managers; or distros like
    Lunarvim, AstroNvim, and Lazyvim.

[^9]:
    When I switched to
    [DOOM Emacs](https://www.youtube.com/watch?v=KKfxgSY7O8E&t=158s) for a short
    while, I realized many of the tooling I was used to and loved in Lazyvim
    (for sake of argument) that the amazing and incredibly prolific
    [folke](https://github.com/folke) develops, were concepts inspired from
    Emacs counterparts. It was revealing. These were the catalysts toward the
    final step. Please, correct me if I'm mistaken.

[^10]:
    I cite _every JavaScript framework motto_ mainly as a joke. Anyway, if you
    _hate yourself_ you could watch this
    [fasterthanlime take](https://youtu.be/4YU_r70yGjQ) instead.

[^11]:
    I can't pin point exactly where The Primagen said it. I think it was during
    [his appearance on Lex Fridman](https://youtu.be/tNZnLkRBYA8?si=6-opbkbKP-Iuydl0).
    A great watch. I'm not a regular follower of neither but I genuinely
    appreciated their conversation and felt (not as in pity) for him. I may not
    agree with most of his takes and only occasionally watch his content for
    _light entertainment_ - I don't mean this derogatorily - however, I have
    plenty respect for The Primagen story. You should make time for it and watch
    it.

[^12]:
    When relying on AI, however, I won't _just let it do stuff_. When I need
    help to _understand an issue_ it's analysis first. In the case of _help me
    code this_, I like
    [prompt engineering](https://en.wikipedia.org/wiki/Prompt_engineering).

[^13]:
    [Enshittification](https://en.wikipedia.org/wiki/Enshittification) has
    rendered search engines, basically, SPAM and scam engines. I begrudgingly
    find it quicker to ask my contextualized Kiro cli - after some reading of
    notes and bookmarked articles - to help me understanding an issue at hand.
    Of course, with a good dose of skepticism and the proverbial _pinch of
    salt_.
