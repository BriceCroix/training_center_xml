import 'package:training_center_xml/models/course_folder.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'courses.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxCourses {
  factory TcxCourses.fromXmlElement(XmlElement element) =>
      _$TcxCoursesFromXmlElement(element);

  TcxCourses({
    required this.courseFolder,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  /// Course sub-folder names must be unique.
  @annotation.XmlElement()
  TcxCourseFolder courseFolder;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCoursesBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCoursesBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursesToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursesToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCoursesToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
