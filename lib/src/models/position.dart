import 'package:training_center_xml/src/models/degrees_latitude.dart';
import 'package:training_center_xml/src/models/degrees_longitude.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'position.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxPosition {
  factory TcxPosition.fromXmlElement(XmlElement element) =>
      _$TcxPositionFromXmlElement(element);

  TcxPosition({
    required this.latitudeDegrees,
    required this.longitudeDegrees,
  });

  @annotation.XmlElement(includeIfNull: false)
  TcxDegreesLatitude latitudeDegrees;

  @annotation.XmlElement(includeIfNull: false)
  TcxDegreesLongitude longitudeDegrees;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxPositionBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxPositionBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPositionToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPositionToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPositionToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
