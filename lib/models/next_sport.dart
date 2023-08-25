import 'package:training_center_xml/models/activity.dart';
import 'package:training_center_xml/models/activity_lap.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'next_sport.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxNextSport {
  factory TcxNextSport.fromXmlElement(XmlElement element) =>
      _$TcxNextSportFromXmlElement(element);

  TcxNextSport({
    required this.activity,
    this.transition,
  });

  @annotation.XmlElement(includeIfNull: false)
  TcxActivityLap? transition;

  @annotation.XmlElement(includeIfNull: false)
  TcxActivity activity;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxNextSportBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxNextSportBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNextSportToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNextSportToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNextSportToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
