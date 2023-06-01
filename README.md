# My personal changes of [tide](https://github.com/IlanCosman/tide) functions

If you ever wonder how my fish shell prompt looks like that, this is how

## Huge warning!

In the [tide plugin](https://github.com/IlanCosman/tide), you're not supposed to change the actual functions to begin with.

Instead, you should be using options [provided by the plugin](https://github.com/IlanCosman/tide/wiki/Configuration) to set everything up.

Unfortunately, tide is pretty limited in what you can do.

For example, there isn't even an option to just show the current directory, you have to look at the whole path in some way.

There isn't a way to make a three lined prompt.

> I know it's a crazy idea to begin with, but it should be pretty easily possible, like it is in [Starship](https://starship.rs/config/)

So I decided to change the implementation of some tide functions to get the behavior that I want.

### I do **not** recommend doing this!

I had to make a whole repository to track my tweaks, and with updates in tide, the implementation *will* change, making me redo most things every time.

### I am not a fish programmer

So for the most part, I know what I'm doing only up to like 40%

**You should not trust my changes.**

### "I don't care!"

If you don't, feel free to use my modified functions.

## Installation

First of all, `git clone` this repository.

The location absolutely doesn't matter, pick whereever is most comfortable to you.

### Git

```
git clone https://github.com/Axlefublr/tide-functions
```

### Github Cli

```shell
gh clone Axlefublr/tide-functions
```
> It doesn't matter which one you pick, the second one is just cooler, that's it

If you hate the name, now's the time to change it

```shell
mv tide-functions my-better-name
```

Now that you cloned the repo, cd into it.

```shell
cd tide-functions
```

And run this (with fish)

```shell
for file in (ls *)
	if test "$file" = "README.md"
		continue
	end
	set -l source_path (realpath $file)
	set -l dest_path "~/.config/fish/functions/$file"
	ln -fs $source_path $dest_path
end
```

The above code makes symlinks for every function in this repo.

Those symlinks will **replace** the original functions in `~/.config/fish/functions`

The symlink for the README file won't be made because obviously.

The reasons why I do it this way:

1. I get to make changes in a more friendly directory, rather than the original path (which I don't like).
1. I only track the changes in the tide functions, effectively .gitignoring all the other functions that will be in your `functions` directory.
1. If you update your tide plugin, you'll see all the changes in this directory as well, since they are linked.
That means you can easily `git reset --hard HEAD -- file` to revert any changes you don't want.

> Consider the fact that I may, at any time, use an older version of tide, where my changes will conflict with how the plugin currently works. I don't know if that's the case, but it may be in the future.

## It doesn't work!

If that's the case, that's on you for trusting some random girl on the internet lmao