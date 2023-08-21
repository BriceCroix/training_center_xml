import 'package:training_center_xml/models/degrees_latitude.dart';
import 'package:training_center_xml/models/degrees_longitude.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'position.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxPosition {
  factory TcxPosition.fromXmlElement(XmlElement element) =>
      _$TcxPositionFromXmlElement(element);

  TcxPosition({
    required this.latitudeDegrees,
    required this.longitudeDegrees,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  TcxDegreesLatitude latitudeDegrees;

  @annotation.XmlElement()
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