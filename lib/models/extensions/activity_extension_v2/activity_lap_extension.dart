import 'package:training_center_xml/models/cadence_value.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/extensions/activity_extension_v2/namespace.dart';
import 'package:training_center_xml/models/extensions/extension.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_lap_extension.g.dart';

@annotation.XmlRootElement(name: 'LX')
@annotation.XmlSerializable()
class TcxActivityLapExtension extends TcxExtension {
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

  static const String namespace = namespaceActivityExtensionV2;

  @annotation.XmlElement()
  double? avgSpeed;

  @annotation.XmlElement()
  TcxCadenceValue? maxBikeCadence;

  // AvgBikeCadence is stored in the TC2 ActivityLap_t Cadence field.
  @annotation.XmlElement()
  TcxCadenceValue? avgRunCadence;

  @annotation.XmlElement()
  TcxCadenceValue? maxRunCadence;

  @annotation.XmlElement()
  int? steps;

  @annotation.XmlElement()
  int? avgWatts;

  @annotation.XmlElement()
  int? maxWatts;

  @annotation.XmlElement()
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
