import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'week.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxWeek {
  factory TcxWeek.fromXmlElement(XmlElement element) =>
      _$TcxWeekFromXmlElement(element);

  TcxWeek({
    required this.startDay,
    this.notes,
  });

  /// The week is written out only if the notes are present.
  @annotation.XmlElement(includeIfNull: false)
  String? notes;

  // Should be Date, not DateTime
  @annotation.XmlAttribute()
  DateTime startDay;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWeekBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWeekBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWeekToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWeekToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWeekToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
