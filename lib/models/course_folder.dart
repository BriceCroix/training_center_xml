import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/name_key_reference.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course_folder.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxCourseFolder {
  factory TcxCourseFolder.fromXmlElement(XmlElement element) =>
      _$TcxCourseFolderFromXmlElement(element);

  TcxCourseFolder({
    required this.name,
    this.extensions,
    this.notes,
    this.courseNameRef,
    this.folder,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  List<TcxCourseFolder>? folder;

  @annotation.XmlElement()
  List<TcxNameKeyReference>? courseNameRef;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  String name;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseFolderBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseFolderBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseFolderToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseFolderToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseFolderToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
