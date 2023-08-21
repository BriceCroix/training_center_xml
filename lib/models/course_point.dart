import 'package:training_center_xml/models/course_point_name.dart';
import 'package:training_center_xml/models/course_point_type.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/position.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course_point.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxCoursePoint {
  factory TcxCoursePoint.fromXmlElement(XmlElement element) =>
      _$TcxCoursePointFromXmlElement(element);

  TcxCoursePoint({
    required this.name,
    required this.time,
    required this.position,
    required this.pointType,
    this.altitudeMeters,
    this.extensions,
    this.notes,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  TcxCoursePointName name;

  @annotation.XmlElement()
  DateTime time;

  @annotation.XmlElement()
  TcxPosition position;

  @annotation.XmlElement()
  double? altitudeMeters;

  @annotation.XmlElement()
  TcxCoursePointType pointType;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCoursePointBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCoursePointBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursePointToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursePointToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursePointToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
