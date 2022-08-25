import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';
import 'tcx_degrees_latitude.dart';
import 'tcx_degrees_longitude.dart';

/// Represents a position on a map.
class TcxPosition implements TcxSerializable {
  static const latitudeDegreesXmlTag = "LatitudeDegrees";
  /// Latitude coordinate of this position. This field is required by the TCX schema definition.
  late TcxDegreesLatitude latitudeDegrees;
  static const longitudeDegreesXmlTag = "LongitudeDegrees";
  /// Longitude coordinate of this position. This field is required by the TCX schema definition.
  late TcxDegreesLongitude longitudeDegrees;

  TcxPosition(
      {TcxDegreesLatitude? latitudeDegrees,
      TcxDegreesLongitude? longitudeDegrees})
      : latitudeDegrees = latitudeDegrees ?? 0,
        longitudeDegrees = longitudeDegrees ?? 0;

  @override
  XmlElement toXmlElement(XmlName name) {
    return XmlElement(name, [], [
      XmlElement(XmlName(latitudeDegreesXmlTag), [],
          [XmlText(latitudeDegrees.toString())]),
      XmlElement(XmlName(longitudeDegreesXmlTag), [],
          [XmlText(longitudeDegrees.toString())]),
    ]);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxPosition.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    bool latitudeDegreesInitialized = false;
    bool longitudeDegreesInitialized = false;
    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case latitudeDegreesXmlTag:
          latitudeDegrees = double.parse(child.text);
          latitudeDegreesInitialized = true;
          break;
        case longitudeDegreesXmlTag:
          longitudeDegrees = double.parse(child.text);
          longitudeDegreesInitialized = true;
          break;
        default:
          error = true;
          break;
      }
    }
    error =
        error || !latitudeDegreesInitialized || !longitudeDegreesInitialized;

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxPosition.}"));
    }
  }
}
