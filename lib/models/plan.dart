import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/training_type.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'plan.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxPlan {
  factory TcxPlan.fromXmlElement(XmlElement element) =>
      _$TcxPlanFromXmlElement(element);

  TcxPlan({
    required this.intervalWorkout,
    required this.type,
    this.name,
    this.extensions,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  String? name;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  TcxTrainingType type;

  @annotation.XmlAttribute()
  bool intervalWorkout;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxPlanBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxPlanBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPlanToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPlanToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxPlanToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
