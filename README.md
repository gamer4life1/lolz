# Stoke 🔥

An MPR helper written in bash

## How to install

### Install via MPR

Just clone `https://mpr.hunterwittenborn.com/packages/stoke-git/` and run `makedeb -si` 
or 
install it via `tap` (but that's too easy, who wants to do that?)

### Install directly

Download the binary:
`sudo curl -L https://github.com/Henryws/stoke/raw/master/stoke -o /usr/local/bin/stoke`

Set permissions:
`sudo chmod +x /usr/local/bin/stoke`

You're ready!


### Features
* Can install MPR dependencies (tap, I'm looking at you)
* Parsable, easy to script with (tap, 👀)
* All in one script (tap...)

### How to use
Flags in Stoke are exactly like apt
`stoke install pkg` Will install a package. If you specify `stoke install -y pkg`, Stoke will not open your editor to review the PKGBUILD

`stoke remove pkg` Will remove a package

`stoke search pkg` Will search for a package

`stoke list` Will list packages installed

`stoke upgrade` Will check for updates to packages. If you specify `stoke upgrade --git`, Stoke will update **all** git packages

### [Benchmarks against tap](https://tenor.com/view/baby-cute-smile-gif-12843681)
#### Searching
- `tap search ls`
```bash
Benchmark #1: tap search ls
  Time (mean ± σ):     732.5 ms ± 829.6 ms    [User: 295.3 ms, System: 41.4 ms]
  Range (min … max):   461.9 ms … 3093.6 ms    10 runs
```
- `stoke search ls`
```bash
Benchmark #1: ./stoke search ls
  Time (mean ± σ):     363.6 ms ±  26.4 ms    [User: 175.2 ms, System: 33.6 ms]
  Range (min … max):   325.0 ms … 404.9 ms    10 runs
```
#### Listing
- `tap list-packages`
```bash
Benchmark #1: tap list-packages
  Time (mean ± σ):     161.4 ms ±   8.3 ms    [User: 111.5 ms, System: 23.4 ms]
  Range (min … max):   157.9 ms … 191.3 ms    15 runs
```
- `stoke list`
```bash
Benchmark #1: ./stoke list
  Time (mean ± σ):     161.7 ms ±   2.5 ms    [User: 145.2 ms, System: 24.3 ms]
  Range (min … max):   159.8 ms … 171.2 ms    17 runs
```
What was interesting here is that tap had 2 packages installed (gendesk and tap), but stoke barely lost with more packages installed (gendesk, tap, mangohud, python3-pypresence and rare)
