import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/course_lap.dart';
import 'package:training_center_xml/models/course_point.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/track.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxCourse {
  factory TcxCourse.fromXmlElement(XmlElement element) =>
      _$TcxCourseFromXmlElement(element);

  TcxCourse({
    required this.name,
    this.notes,
    this.extensions,
    this.track,
    this.lap,
    this.creator,
    this.coursePoint,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  String name;

  @annotation.XmlElement()
  List<TcxCourseLap>? lap;

  @annotation.XmlElement()
  List<TcxTrack>? track;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  List<TcxCoursePoint>? coursePoint;

  @annotation.XmlElement()
  TcxAbstractSource? creator;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
