
build-app:
	shards build --link-flags="-rpath @executable_path/../Frameworks -L`pwd`/vendor"
	cp ./bin/MyCocoaApplication ./build/MyCocoaApplication.app/Contents/MacOS/
	cp ./vendor/Frameworks/libui.A.dylib ./build/MyCocoaApplication.app/Contents/Frameworks/

run: build-app
	#open ./build/MyCocoaApplication.app
	./build/MyCocoaApplication.app/Contents/MacOS/MyCocoaApplication

package:
	shards build --release --link-flags="-rpath @executable_path/../Frameworks -L`pwd`/vendor"
	cp ./bin/MyCocoaApplication ./build/MyCocoaApplication.app/Contents/MacOS/
	cp ./vendor/Frameworks/libui.A.dylib ./build/MyCocoaApplication.app/Contents/Frameworks/
	
inspect:
	otool -L ./bin/app

validate:
	otool -L ./bin/app | grep local