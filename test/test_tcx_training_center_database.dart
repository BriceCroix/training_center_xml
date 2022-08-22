import 'package:flutter_test/flutter_test.dart';
import 'package:training_center_xml/training_center_xml.dart';

void testTcxTrainingCenterDatabase() {
  group('TcxTrainingCenterDatabase', () {
    test('Import/Export symmetric', () {
      String xmlString = '<?xml version="1.0" encoding="UTF-8"?>'
          '<TrainingCenterDatabase xsi:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd" xmlns:ns5="http://www.garmin.com/xmlschemas/ActivityGoals/v1" xmlns:ns3="http://www.garmin.com/xmlschemas/ActivityExtension/v2" xmlns:ns2="http://www.garmin.com/xmlschemas/UserProfile/v2" xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns4="http://www.garmin.com/xmlschemas/ProfileExtension/v1">'
          '<Activities>'
          '<Activity Sport="Biking">'
          '<Id>2021-12-20T19:38:11.000Z</Id>'
          '<Lap StartTime="2021-12-20T19:38:11.000Z">'
          '<TotalTimeSeconds>2096.0</TotalTimeSeconds>'
          '<DistanceMeters>13487.107392</DistanceMeters>'
          '<MaximumSpeed>11.423928384</MaximumSpeed>'
          '<Calories>402</Calories>'
          '<Intensity>Active</Intensity>'
          '<TriggerMethod>Manual</TriggerMethod>'
          '<Track>'
          '<Trackpoint>'
          '<Time>2021-12-20T19:38:15.335Z</Time>'
          '<Position>'
          '<LatitudeDegrees>48.635103</LatitudeDegrees>'
          '<LongitudeDegrees>-1.510497</LongitudeDegrees>'
          '</Position>'
          '<AltitudeMeters>87.6771</AltitudeMeters>'
          '</Trackpoint>'
          '<Trackpoint>'
          '<Time>2021-12-20T19:38:15.353Z</Time>'
          '<Position>'
          '<LatitudeDegrees>48.635292</LatitudeDegrees>'
          '<LongitudeDegrees>-1.510103</LongitudeDegrees>'
          '</Position>'
          '<DistanceMeters>2.5626</DistanceMeters>'
          '</Trackpoint>'
          '<Trackpoint>'
          '<Time>2021-12-20T19:38:15.364Z</Time>'
          '</Trackpoint>'
          '</Track>'
          '</Lap>'
          '</Activity>'
          '</Activities>'
          '</TrainingCenterDatabase>';
      TcxTrainingCenterDatabase tcx =
          TcxTrainingCenterDatabase.fromXmlString(xmlString);
      expect(tcx.toXmlString(), xmlString);
    });
  });
}
