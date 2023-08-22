import 'package:training_center_xml/models/cadence_value.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/extensions/activity_extension_v2/cadence_sensor_type.dart';
import 'package:training_center_xml/models/extensions/activity_extension_v2/namespace.dart';
import 'package:training_center_xml/models/extensions/extension.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_trackpoint_extension.g.dart';

@annotation.XmlRootElement(name: 'TPX')
@annotation.XmlSerializable()
class TcxActivityTrackpointExtension extends TcxExtension {
  factory TcxActivityTrackpointExtension.fromXmlElement(XmlElement element) =>
      _$TcxActivityTrackpointExtensionFromXmlElement(element);

  TcxActivityTrackpointExtension({
    required this.cadenceSensor,
    this.extensions,
    this.runCadence,
    this.speed,
    this.watts,
  });

  static const String namespace = namespaceActivityExtensionV2;

  @annotation.XmlElement()
  double? speed;

  @annotation.XmlElement()
  TcxCadenceValue? runCadence;

  @annotation.XmlElement()
  int? watts;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  TcxCadenceSensorType cadenceSensor;

  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityTrackpointExtensionBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  @override
  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityTrackpointExtensionBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityTrackpointExtensionToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  @override
  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityTrackpointExtensionToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  @override
  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityTrackpointExtensionToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
