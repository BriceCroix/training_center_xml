import 'dart:io';

import 'package:training_center_xml/training_center_xml.dart';

void main() {
  // Read tcx file from disk
  final myTcxString = File('my_tcx_file.tcx').readAsStringSync();
  var tcx = TcxTrainingCenterDatabase.fromXmlString(myTcxString);

  // Modify some things like the sport of the first activity
  tcx.activities?.activity?.firstOrNull?.sport = TcxSport.running;

  // Write back to disk
  File('my_tcx_file_edited.tcx').writeAsStringSync(tcx.toXmlString());

  // Create tcx from scratch
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

  // Write this newly-created tcx to disk
  File('my_new_tcx_file.tcx').writeAsStringSync(newTcx.toXmlString());
}
