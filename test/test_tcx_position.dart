import 'package:flutter_test/flutter_test.dart';
import 'package:training_center_xml/training_center_xml.dart';
import 'package:xml/xml.dart';

void testTcxPosition() {
  group('TcxPosition', () {
    test('Export to xml positive', () {
      TcxPosition tcxPosition =
          TcxPosition(latitudeDegrees: 45.5, longitudeDegrees: 30.2);
      XmlElement tcxPositionXmlElement =
          tcxPosition.toXmlElement(XmlName('Position'));
      String expectation =
          "<Position><LatitudeDegrees>45.5</LatitudeDegrees><LongitudeDegrees>30.2</LongitudeDegrees></Position>";
      expect(tcxPositionXmlElement.toXmlString(), expectation);
    });

    test('Export to xml negative', () {
      TcxPosition tcxPosition =
      TcxPosition(latitudeDegrees: -14.37, longitudeDegrees: -25.14);
      XmlElement tcxPositionXmlElement =
      tcxPosition.toXmlElement(XmlName('Position'));
      String expectation =
          "<Position><LatitudeDegrees>-14.37</LatitudeDegrees><LongitudeDegrees>-25.14</LongitudeDegrees></Position>";
      expect(tcxPositionXmlElement.toXmlString(), expectation);
    });

    test('Creation from xml', () {
      String xmlString =
          "<Position><LatitudeDegrees>-14.37</LatitudeDegrees><LongitudeDegrees>-25.14</LongitudeDegrees></Position>";
      XmlDocument document = XmlDocument.parse(xmlString);
      TcxPosition tcxPositionFromValues =
        TcxPosition(latitudeDegrees: -14.37, longitudeDegrees: -25.14);
      TcxPosition tcxPositionFromXmlElement = TcxPosition.fromXmlElement(document.rootElement);
      expect(tcxPositionFromValues.latitudeDegrees, tcxPositionFromXmlElement.latitudeDegrees);
      expect(tcxPositionFromValues.longitudeDegrees, tcxPositionFromXmlElement.longitudeDegrees);
    });

    test('Creation from invalid xml : latitude given twice', () {
      String xmlString =
          "<Position><LatitudeDegrees>-14.37</LatitudeDegrees><LatitudeDegrees>-25.14</LatitudeDegrees></Position>";
      XmlDocument document = XmlDocument.parse(xmlString);
      expect(() => TcxPosition.fromXmlElement(document.rootElement), throwsA(isA<ArgumentError>()));
    });

    test('Creation from invalid xml : only longitude provided', () {
      String xmlString =
          "<Position><LongitudeDegrees >-25.14</LongitudeDegrees></Position>";
      XmlDocument document = XmlDocument.parse(xmlString);
      expect(() => TcxPosition.fromXmlElement(document.rootElement), throwsA(isA<ArgumentError>()));
    });
    test('Creation from invalid xml : too many children', () {
      String xmlString =
          "<Position><LatitudeDegrees>-14.37</LatitudeDegrees><LongitudeDegrees>-25.14</LongitudeDegrees><Foo>-14.37</Foo></Position>";
      XmlDocument document = XmlDocument.parse(xmlString);
      expect(() => TcxPosition.fromXmlElement(document.rootElement), throwsA(isA<ArgumentError>()));
    });
  });
}
