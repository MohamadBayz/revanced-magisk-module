# YouTube ReVanced Magisk Module

<sub>(unaffiliated whatsoever)<sub>

This repo includes a simple script that downloads all the latest version of necessary prebuilt revanced tools and the stock APKs of YouTube and YouTube Music from APKMirror, applies the patches and creates magisk modules.

You will need to install the stock YouTube app matching with the module's version on your phone, there is no need for the split APKs or SAI anymore, the regular APK is just fine. The link is also provided in release notes.

You can get the [latest CI release](https://github.com/j-hc/revanced-magisk-module/releases) from here.

## Updating
The modules support Magisk update which means you will receive updates from your Magisk app, downloading from github releases and reflashing is not necessary.

## Note
If you wish to include/exclude some patches to your liking:
 * Star the repo :eyes:
 * Fork the repo
 * Edit the patcher args in [`build.sh`](./build.sh)
 * Run the [workflow](../../actions/workflows/build.yml)
 * Grab your module from [releases](../../releases)

# Building the Magisk Modules
If you are going to build locally, make sure you have [Azul Zulu distribution of OpenJDK 17](https://www.azul.com/downloads/?version=java-17-lts&os=linux&architecture=x86-64-bit&package=jdk)

```console
$ ./build.sh all
```
