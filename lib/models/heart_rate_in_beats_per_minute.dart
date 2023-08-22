import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'heart_rate_in_beats_per_minute.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxHeartRateInBeatsPerMinute {
  factory TcxHeartRateInBeatsPerMinute.fromXmlElement(XmlElement element) =>
      _$TcxHeartRateInBeatsPerMinuteFromXmlElement(element);

  TcxHeartRateInBeatsPerMinute({
    required this.value,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  int value;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHeartRateInBeatsPerMinuteBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHeartRateInBeatsPerMinuteBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHeartRateInBeatsPerMinuteToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHeartRateInBeatsPerMinuteToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHeartRateInBeatsPerMinuteToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
