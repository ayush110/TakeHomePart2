## Build and Run
Ensure you have Qt Creator installed
```
git clone https://github.com/ayush110/TakeHomePart2.git
cd TakeHomePart2
mkdir build && cd build
cmake -DCMAKE_PREFIX_PATH=/path/to/qt-static ..
cmake --build . --config Release
./TakeHomePart2
```

## Description

Simple Auto Maintenance app with video tutorial features, basic car information, service history (including next service date). 

#### Video Tutorial Button
This button opens a dialog to showcase a video tutorial.

#### Service History
This button loads service data about specific car through C++ backend. 

#### Service Date
Upon clicking the date, it will generate a new random service date.

## Design Choices 
This Application is a Qt Quick application. I chose this over a Qt Widgets application because of the ability to create more complicated and better-looking UIs easily through QML. The drawbacks are that Qt Quick is not as mature and developed as Qt Widgets, hence it could have unexpected errors, however the community around this is increasing and there is already a ton of documentation, so this shouldn't be a big issue.

`.qml` files are used for UI (limited use of qml for performance reasons).
This includes a main application window and a couple custom components for better file structure

`.cpp` files are for backend. This handles video state, loading necessary data, etc..

`qmlRegisterSingletonInstance` function is used to register instances of C++ classes as singletons in QML. A singleton is an object-oriented design pattern that ensures a class has only one instance and provides a global point of access to that instance.

## Limitations
- Could have better QML file structure upon scaling of features
- Could incorporate MVC pattern for C++ backend for structure
- Better UI for sure
- Might have performance issues relative to Qt Wdigets application, but shouldn't be too bad
- Current design approach is relatively straightforward due to simplicity of app. Need to create reusable components.
- Need better separation of concern between QML and C++
- Qt quick applications have dependencies on Qt framework, big hurdle when deplying since you would have to either statically link binaries (causing large files) or use a framework like Qt Lite. This is becoming increasingly popular


