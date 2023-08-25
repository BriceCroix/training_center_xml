import 'package:training_center_xml/src/models/abstract_source.dart';
import 'package:training_center_xml/src/models/course_lap.dart';
import 'package:training_center_xml/src/models/course_point.dart';
import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/track.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
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

  @annotation.XmlElement(includeIfNull: false)
  String name;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxCourseLap>? lap;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxTrack>? track;

  @annotation.XmlElement(includeIfNull: false)
  String? notes;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxCoursePoint>? coursePoint;

  @annotation.XmlElement(includeIfNull: false)
  TcxAbstractSource? creator;

  @annotation.XmlElement(includeIfNull: false)
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
