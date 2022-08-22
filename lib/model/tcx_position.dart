import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';
import 'tcx_degrees_latitude.dart';
import 'tcx_degrees_longitude.dart';

class TcxPosition implements TcxSerializable {
  static const latitudeDegreesXmlTag = "LatitudeDegrees";
  TcxDegreesLatitude latitudeDegrees;
  static const longitudeDegreesXmlTag = "LongitudeDegrees";
  TcxDegreesLongitude longitudeDegrees;

  TcxPosition({required this.latitudeDegrees, required this.longitudeDegrees});

  @override
  XmlElement toXmlElement(XmlName name) {
    return XmlElement(name, [], [
      XmlElement(XmlName(latitudeDegreesXmlTag), [],
          [XmlText(latitudeDegrees.toString())]),
      XmlElement(XmlName(longitudeDegreesXmlTag), [],
          [XmlText(longitudeDegrees.toString())]),
    ]);
  }
}
