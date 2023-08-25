import 'package:training_center_xml/src/models/cadence_value.dart';
import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/extensions/activity_extension_v2/namespace.dart';
import 'package:training_center_xml/src/models/extensions/extension.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_lap_extension.g.dart';

@annotation.XmlRootElement(namespace: namespaceActivityExtensionV2, name: 'LX')
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxActivityLapExtension implements TcxExtension {
  factory TcxActivityLapExtension.fromXmlElement(XmlElement element) =>
      _$TcxActivityLapExtensionFromXmlElement(element);

  TcxActivityLapExtension({
    this.extensions,
    this.avgRunCadence,
    this.avgSpeed,
    this.avgWatts,
    this.maxBikeCadence,
    this.maxRunCadence,
    this.maxWatts,
    this.steps,
  });

  @annotation.XmlElement(includeIfNull: false)
  double? avgSpeed;

  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? maxBikeCadence;

  // AvgBikeCadence is stored in the TC2 ActivityLap_t Cadence field.
  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? avgRunCadence;

  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? maxRunCadence;

  @annotation.XmlElement(includeIfNull: false)
  int? steps;

  @annotation.XmlElement(includeIfNull: false)
  int? avgWatts;

  @annotation.XmlElement(includeIfNull: false)
  int? maxWatts;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityLapExtensionBuildXmlChildren(
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
    _$TcxActivityLapExtensionBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapExtensionToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  @override
  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapExtensionToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  @override
  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapExtensionToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
