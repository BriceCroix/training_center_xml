import 'package:training_center_xml/src/models/cadence_value.dart';
import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/extensions/activity_extension_v2/cadence_sensor_type.dart';
import 'package:training_center_xml/src/models/extensions/activity_extension_v2/namespace.dart';
import 'package:training_center_xml/src/models/extensions/extension.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_trackpoint_extension.g.dart';

@annotation.XmlRootElement(namespace: namespaceActivityExtensionV2, name: 'TPX')
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxActivityTrackpointExtension implements TcxExtension {
  factory TcxActivityTrackpointExtension.fromXmlElement(XmlElement element) =>
      _$TcxActivityTrackpointExtensionFromXmlElement(element);

  TcxActivityTrackpointExtension({
    required this.cadenceSensor,
    this.extensions,
    this.runCadence,
    this.speed,
    this.watts,
  });

  @annotation.XmlElement(includeIfNull: false)
  double? speed;

  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? runCadence;

  @annotation.XmlElement(includeIfNull: false)
  int? watts;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  // This field is made nullable because, although the attribute is mandated by
  // the schema definition, Strava seems not to include it.
  @annotation.XmlAttribute()
  TcxCadenceSensorType? cadenceSensor;

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
