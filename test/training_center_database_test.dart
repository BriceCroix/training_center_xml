import 'package:test/test.dart';
import 'package:training_center_xml/training_center_xml.dart';

void main() {
  test('Create from scratch', () {
    // Expect no throw
    expect(
      () {
        final tcx = TcxTrainingCenterDatabase(
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
                            heartRateBpm:
                                TcxHeartRateInBeatsPerMinute(value: 90),
                            altitudeMeters: 56,
                            position: TcxPosition(
                              latitudeDegrees: 0.0,
                              longitudeDegrees: 0.0,
                            ),
                          ),
                          TcxTrackpoint(
                            time: DateTime(2023, 08, 21, 18, 30, 31),
                            distanceMeters: 10,
                            heartRateBpm:
                                TcxHeartRateInBeatsPerMinute(value: 100),
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
        //stdout.write(tcx.toXmlString(pretty: true));
        tcx.toXmlString();
      },
      returnsNormally,
    );
  });

  test('Read and write back', () {
    const xml = '''
<?xml version="1.0" encoding="UTF-8"?>
<TrainingCenterDatabase xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" xmlns:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd" xmlns:ax="http://www.garmin.com/xmlschemas/ActivityExtension/v2">
    <Activities>
        <Activity Sport="Biking">
            <Id>2022-08-15T12:08:50.000Z</Id>
            <Lap StartTime="2022-08-15T12:08:50.000Z">
                <TotalTimeSeconds>2888.0</TotalTimeSeconds>
                <DistanceMeters>13910.2</DistanceMeters>
                <MaximumSpeed>14.8</MaximumSpeed>
                <Calories>0</Calories>
                <Intensity>Active</Intensity>
                <TriggerMethod>Manual</TriggerMethod>
                <Track>
                    <Trackpoint>
                        <Time>2022-08-15T12:08:50.000Z</Time>
                        <Position>
                            <LatitudeDegrees>48.45684</LatitudeDegrees>
                            <LongitudeDegrees>-1.5616</LongitudeDegrees>
                        </Position>
                        <AltitudeMeters>103.1</AltitudeMeters>
                        <DistanceMeters>0.0</DistanceMeters>
                        <Extensions>
                            <TPX>
                                <Speed>0.0</Speed>
                            </TPX>
                        </Extensions>
                    </Trackpoint>
                    <Trackpoint>
                        <Time>2022-08-15T12:56:58.000Z</Time>
                        <Position>
                            <LatitudeDegrees>48.478954</LatitudeDegrees>
                            <LongitudeDegrees>-1.5951</LongitudeDegrees>
                        </Position>
                        <AltitudeMeters>102.3</AltitudeMeters>
                        <DistanceMeters>13910.2</DistanceMeters>
                        <Extensions>
                            <TPX>
                                <Speed>0.7</Speed>
                            </TPX>
                        </Extensions>
                    </Trackpoint>
                </Track>
            </Lap>
        </Activity>
    </Activities>
</TrainingCenterDatabase>''';

    final tcx = TcxTrainingCenterDatabase.fromXmlString(xml);
    expect(tcx.toXmlString(pretty: true, indent: '    '), xml);
  });
}
