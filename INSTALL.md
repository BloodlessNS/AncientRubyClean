# Install Guide

If you just want to play Polished Crystal, use one of the .ips patches as described in [README.md](README.md#download-and-play). To build a ROM yourself from the source code, follow these instructions.

> You know it's sitting back and looking at it that you realize that Gamefreak is actually really good devs.  
> Like you have Pokemon and it's a simple formula "How can you fuck it up?" and then all of these Romhacks basically go "Like this."
>
> — Anonymous, [/vp/](http://boards.4chan.org/vp/)


## Windows

To build on Windows, install [**Cygwin**](http://cygwin.com/install.html) with the default settings.

In the installer, select the following packages: `git`, `python`, `make`, and `gcc-core`.

In the **Cygwin terminal**:

```bash
git clone https://github.com/roukaour/polishedcrystal.git
cd polishedcrystal
mkdir rgbds
```

Then download [**rgbds**](https://github.com/bentley/rgbds/). You'll need version 0.3.3 or later. Extract the archive and put all the .exe and .dll files in polishedcrystal/rgbds.

To build **polishedcrystal.gbc**:

```bash
make
```

To build other versions:

```bash
make [sapphire] [nortc][debug]
```

For example, to build a sapphire nortc version:

```bash
make ruby nortc
```


## Linux

Python 2.7 is required.

```bash
sudo apt-get install make python gcc git bison

git clone https://github.com/rednex/rgbds.git
cd rgbds
sudo make install
cd ..

git clone https://github.com/roukaour/polishedcrystal.git
cd polishedcrystal
```

To build **polishedcrystal.gbc**:

```bash
make
```

To build other versions:

```bash
make [fsapphire] [nortc] [debug]
```


## Mac OS X

In **Terminal**, run:

```bash
xcode-select --install

git clone https://github.com/rednex/rgbds.git
cd rgbds
sudo make install
cd ..

git clone https://github.com/roukaour/polishedcrystal.git
cd polishedcrystal
```

To build **polishedcrystal.gbc**:

```bash
make
```

To build other versions:

```bash
make [sapphire] [nortc] [debug]
```
