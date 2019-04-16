# Cocoa.cr
A distributable macOS GUI application framework for Crystal using libui and Hedron.

## Quickstart

1. Clone the project
2. `$ make run`  OR  `$ make build && open ./build/MyCocoaApplication.app`

NOTE: Do not run `shards install` or `shards update`, the Hedron library has no releases, and has been modified to link with the libui.A.dylib file in the './vendor' directory. If you whish to install a shard, make a backup of the 'lib/hedron' directory.

## Structure

All of the user interface configuration and management is in the 'src/app/ui' directory. The actual logic of your program should be inside of the 'src/app/delegates' directory.

I am a Junior in high school, and made this project in a weekend for self use, but wanted to share it with other people. I made this because I wanted the ability to make a GUI application in Crystal, and distribute it to my friends. I also wanted the ability to have callbacks for events, such as the user clicked the window close button, or cmd+Q. If you have any suggestions or way to make this project better, don't be afraid to open a pull request!

## About

The goal for Cocoa.cr is to provide a structure similar to Cocoa applications bult with XCode, and providing native GUI support. If you come from Objective-C or Swift, you may see some function names that are framiliar, such as 'applicationWillTerminate'. The Crystal part of the application compiles into a partially-static binary, that is included with libgc, libevent, libyaml, libssl, and libcrypto. This means that the crystal standard library can run on any macOS computer, without having those libraries installed. The only library that needs to be included with the program is libui.A.dylib, but running `$ make package` will do the trick by including the dynamic library in the Frameworks subdirectory within the app, so it is distibutable. To make the GUI part more intuitive and flexible, I used the Hedron library, which is an object oriented Crystal library for libui.

# Acknowledgments

hedron-crystal/hedron - OOP interface for libui

Fusion/libui.cr - Creating bindings for libui