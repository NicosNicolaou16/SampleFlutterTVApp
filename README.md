# Sample Flutter TV App

This is a sample project that supports the Android TV OS app. It uses the BLoC architecture pattern,
along with Dio for network management and Drift for database handling.

NOTE: EXAMPLE ONLY FOR ANDROID

<a title="simulator_image"><img src="Screenshot_20231119_183026.png" height="300" width="500"></a>

## Similar project with (Kotlin Language)

https://github.com/NicosNicolaou16/SampleAndroidTvApp <br />

# The Project Contain the following technologies and libraries

Android TV OS support <br />
[Bloc Patterns using single state](https://pub.dev/packages/flutter_bloc) along with repositories
and services, separates business logic, data access, and UI by using streams to handle state and
manage data flow. ([Bloc Pattern Documentation](https://bloclibrary.dev/getting-started/)) <br />
[Dio Network Manager](https://pub.dev/packages/dio) is responsible for making requests and
retrieving data from the remote server. <br />
Drift Database (SQL) <br />
[Drift Database](https://drift.simonbinder.eu/docs/getting-started/) is responsible for saving the
retrieved data from the remote server, querying data from the local database, and supporting offline
functionality. ([Drift Database Documentation](https://pub.dev/packages/drift)) <br />
[Cached Network Image](https://pub.dev/packages/cached_network_image) is a package that it is
responsible for loading the images and supports offline functionality.  <br />

## Versions

Flutter SDK version: 3.24.4 <br />
Dart Version: 3.5.4 <br />

# Setup

## Setup in Manifest

```xml

<manifest>

    <uses-feature android:name="android.software.leanback" android:required="false" />

    <uses-feature android:name="android.hardware.touchscreen" android:required="false" />

    <application android:banner="@mipmap/ic_launcher">
        <!--other code here-->
        <activity>
            <!--other code here-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
                <category android:name="android.intent.category.LEANBACK_LAUNCHER" />
            </intent-filter>
        </activity>
        <!--other code here-->
    </application>
</manifest>
```

## Check my article

https://medium.com/@nicosnicolaou/android-tv-application-jetpack-compose-and-flutter-f4decfa765c6

# Feeds/Urls/End Point (parsing some data from response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References

https://mobikul.com/tv-app-using-flutter/ <br />
https://stackoverflow.com/questions/69607355/how-to-create-stack-vertical-listview-and-horizontal-listview-in-flutter-draggab <br />