# Sample Flutter TV App

This is a sample project that supports the Android TV OS app. It uses the BLoC architecture pattern,
along with Dio for network management and Drift for database handling.

> [!IMPORTANT]
> NOTE: EXAMPLE FOR ANDROID ONLY. <br />

<a title="simulator_image"><img src="Screenshot_20231119_183026.png" height="300" width="500"></a>

# The Project Contain the following technologies and libraries

[Android TV OS](https://developer.android.com/tv) is a version of Android designed for smart TVs,
providing an optimized interface for streaming and apps. <br />
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

> [!IMPORTANT]  
> Check my article for the setup :point_right: [Android TV Application (Setup for Jetpack Compose and Flutter) - Medium](https://medium.com/@nicosnicolaou/android-tv-application-jetpack-compose-and-flutter-f4decfa765c6) :point_left: <br />

> [!IMPORTANT]
> Similar project with (Kotlin Language) :point_right: [SampleAndroidTvApp](https://github.com/NicosNicolaou16/SampleAndroidTvApp) :point_left: <br />

## Versioning

Flutter SDK version: 3.29.3 <br />
Dart Version: 3.7.2 <br />

# Feeds/Urls/End Point (parsing some data from response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References

https://mobikul.com/tv-app-using-flutter/ <br />
https://stackoverflow.com/questions/69607355/how-to-create-stack-vertical-listview-and-horizontal-listview-in-flutter-draggab <br />