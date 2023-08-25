# Training Center XML

This package aims at easily handling Training Center XML files (`.tcx`) in dart and flutter.


## Features

This package can be used to :
- Read and print `.tcx` files' data.
- Read, modify, and write back `.tcx` files' data.
- Create a `.tcx` file from scratch.


## Getting started

To use this package, add this dependency to your `pubspec.yaml` :

```yaml
dependencies  :
  training_center_xml : <latest_version>
```

Alternatively you can also run :

```shell
flutter pub add training_center_xml
```


## Usage

### Philosophy

The aim of this package is to mimic the structure of a TCX file, which is standardized by an xml
schema definition file available [here](https://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd).

As such, the class structure can seem a bit obscure or weird, but this is all done to match the
schema definition.

Certain fields are not mandatory in TCX files, the philosophy about these cases is the following :
- Schema expects exactly 1 field ? -> `TcxType field;`
- Schema expects 0 or 1 field ? -> `TcxType? field;`
- Schema expects 0 or more fields ? -> `List<TcxType>? field;`
- Schema expects 1 or more fields ? -> `List<TcxType> field;`

### Read file

```dart
final myTcxString = File('my_tcx_file.tcx').readAsStringSync();
  var tcx = TcxTrainingCenterDatabase.fromXmlString(myTcxString);
```


### Modify file

There are too many fields that be can modified to be listed here exhaustively, but you can refer to 
the section "Create new tcx file from scratch" to have a better overview of available fields.

Here is an example to change the type of sport of the first activity in the file. Most files only
contain one activity but according to the TCX standard, more than one can be put to a single file.

```dart
tcx.activities?.activity?.firstOrNull?.sport = TcxSport.running;
```


### Write back file

```dart
File('my_tcx_file_edited.tcx').writeAsStringSync(tcx.toXmlString());
```


### Create new tcx file from scratch

This is an example to create a very simple tcx file, in a real world use-case, there would be far
more data, such as more track points, a longer activity, and so on.

```dart
var newTcx = TcxTrainingCenterDatabase(
    activities: TcxActivityList(
      activity: [
        TcxActivity(
          id: DateTime(2023, 08, 21, 18, 30),
          lap: [
            TcxActivityLap(
              calories: 12,
              distanceMeters: 150,
              intensity: TcxIntensity.active,
              startTime: DateTime(2023, 08, 21, 18, 30),
              totalTimeSeconds: 120,
              triggerMethod: TcxTriggerMethod.manual,
              track: [
                TcxTrack(
                  trackpoint: [
                    TcxTrackpoint(
                      time: DateTime(2023, 08, 21, 18, 30, 1),
                      distanceMeters: 1,
                      heartRateBpm: TcxHeartRateInBeatsPerMinute(value: 90),
                      altitudeMeters: 56,
                      position: TcxPosition(
                        latitudeDegrees: 0.0,
                        longitudeDegrees: 0.0,
                      ),
                    ),
                    TcxTrackpoint(
                      time: DateTime(2023, 08, 21, 18, 30, 31),
                      distanceMeters: 10,
                      heartRateBpm: TcxHeartRateInBeatsPerMinute(value: 100),
                      altitudeMeters: 57,
                      position: TcxPosition(
                        latitudeDegrees: 0.1,
                        longitudeDegrees: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
              extensions: TcxExtensions(
                activityLapExtension: [
                  TcxActivityLapExtension(
                    maxRunCadence: 12,
                    avgSpeed: 40,
                  ),
                ],
              ),
            ),
          ],
          sport: TcxSport.running,
        ),
      ],
    ),
  );
```

## Additional information

### Bug report

If you spot a problem, bug, or missing feature, please file a new issue
at [this repository](https://github.com/BriceCroix/training_center_xml).

These package was originally developed to be used with [Movna](https://github.com/MovnaTeam/movna),
an open-source training application written using Flutter.

Feel free to contribute if your favorite feature is missing !


## About TCX Extensions

The TCX schema definition allows for custom extensions from other schemas. Unfortunately it is not
possible to put any class in the fields of the class `TcxExtensions` yet, but the two extensions
`ActivityLapExtension` and `ActivityTrackpointExtension` released by garmin in
[this schema](https://www.garmin.com/xmlschemas/ActivityExtensionv2.xsd) are supported.
If you know about a publicly available TCX extension which is not yet supported please file
an issue !

## How to build

If you wish to build this package yourself or to contribute (please contribute !),
setup your environment as follow :

Make sure [fvm](https://fvm.app/) is installed on your computer.
On Android Studio you can then set the flutter sdk path for this project to `absolute/path/to/this/repository/.fvm/flutter_sdk/`.
All calls to `flutter` in the following shell snippets are actually calls to `fvm flutter`.

To install all dependencies, run :
```shell
flutter pub get
```

To run the few tests available, run :
```shell
flutter test
```
