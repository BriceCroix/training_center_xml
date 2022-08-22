import 'package:flutter_test/flutter_test.dart';
import 'package:training_center_xml/training_center_xml.dart';
import 'package:xml/xml.dart';

void testTcxPosition() {
  group('TcxPosition', () {
    test('Creation positive', () {
      TcxPosition tcxPosition =
          TcxPosition(latitudeDegrees: 45.5, longitudeDegrees: 30.2);
      XmlElement tcxPositionXmlElement =
          tcxPosition.toXmlElement(XmlName('Position'));
      String expectation =
          "<Position><LatitudeDegrees>45.5</LatitudeDegrees><LongitudeDegrees>30.2</LongitudeDegrees></Position>";
      expect(tcxPositionXmlElement.toXmlString(), expectation);
    });

    test('Creation negative', () {
      TcxPosition tcxPosition =
      TcxPosition(latitudeDegrees: -14.37, longitudeDegrees: -25.14);
      XmlElement tcxPositionXmlElement =
      tcxPosition.toXmlElement(XmlName('Position'));
      String expectation =
          "<Position><LatitudeDegrees>-14.37</LatitudeDegrees><LongitudeDegrees>-25.14</LongitudeDegrees></Position>";
      expect(tcxPositionXmlElement.toXmlString(), expectation);
    });
  });
}
