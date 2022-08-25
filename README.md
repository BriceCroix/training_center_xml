<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package aims at easily handling Training Center XML files (`.tcx`) in dart and flutter.

## Features

This package can be used to :
- Read and print a `.tcx` file data.
- Read, modify, and write back a `.tcx` file data.
- Create a `.tcx` file from scratch.

## Getting started

To use this package, add this dependency to your `pubspec.yaml` :

```yaml
dependencies  :
  training_center_xml : ^0.0.1
```

## Usage

### Read file

```dart
File inputFile = File("path/to/my/file.tcx");
TcxTrainingCenterDatabase myTcx = TcxTrainingCenterDatabase.fromXmlString(inputFile.readAsStringSync());
```

### Modify file

```dart
// Change the sport type of the first activity
myTcx.activities?.activity.first.sport = TcxSports.running;
// Change the start date of the first lap of the first activity to now.
myTcx.activities?.activity.first.lap.first.startTime = DateTime.now();
```

Notice that in order to perform these modifications you should first check that your file contains
activities with `myTcx.activities?.activity.isNotEmpty()` and that the first activity contains at
least one lap with `myTcx.activities?.activity.first.lap.isNotEmpty()`.

### Write back file

```dart
File outputFile = File("path/to/my/output/file.tcx");
outputFile.writeAsStringSync(myTcx.toXmlString(pretty:true));
```

### Create new tcx file from scratch

This package was written with the idea of reflecting the objects defined in the TCX XML schema
definition file available [here](https://www8.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd).
Objects fields that must be provided and that are unique are required in each class constructors.
Objects fields that are unique but not necessarily provided are marked with `?`.
Object fields that can be provided several times are stored in Lists. Some of these are required not
to be empty as well in order to be readable by any software.

Here is an example of a Training Center Database object representing a single running activity with
only two points. Keep in mind that mandatory fields are auto assigned There are a lot more fields that can be set.
```dart
TcxTrainingCenterDatabase myCustomTcx = TcxTrainingCenterDatabase();
  myCustomTcx.author = TcxAbstractSource(name: "my application name");
  myCustomTcx.activities = TcxActivityList();
  myCustomTcx.activities!.activity.add(TcxActivity());
  myCustomTcx.activities!.activity.first.sport = TcxSports.running;
  myCustomTcx.activities!.activity.first.id = DateTime.now();
  myCustomTcx.activities!.activity.first.notes = "Some notes about this activity";
  myCustomTcx.activities!.activity.first.lap.add(TcxActivityLap());
  myCustomTcx.activities!.activity.first.lap.first.startTime = DateTime.now();
  myCustomTcx.activities!.activity.first.lap.first.distanceMeters = 500;
  myCustomTcx.activities!.activity.first.lap.first.totalTimeSeconds = 120;
  myCustomTcx.activities!.activity.first.lap.first.maximumHeartRateBeatsPerMinute = TcxHeartRateInBeatsPerMinute(value: 180);
  myCustomTcx.activities!.activity.first.lap.first.track.add(TcxTrack());
  myCustomTcx.activities!.activity.first.lap.first.track.first.trackpoint.add(TcxTrackpoint(
    time: DateTime(2022, 8, 25, 16, 0, 0),
    position: TcxPosition(latitudeDegrees: 48.635103, longitudeDegrees: -1.510497),
  ));
  myCustomTcx.activities!.activity.first.lap.first.track.first.trackpoint.add(TcxTrackpoint(
    time: DateTime(2022, 8, 25, 16, 1, 0),
    position: TcxPosition(latitudeDegrees: 48.635292, longitudeDegrees: -1.510103),
  ));
  ```

## Additional information

If you spot a problem, bug, or missing feature, please post a new issue
at [this repository](https://github.com/BriceCroix/training_center_xml).

These package was originally developed to be used in [Movna](https://github.com/BriceCroix/movna),
an open-source training application written using flutter.

Feel free to contribute if your favorite feature is missing !
