import 'package:training_center_xml/models/courses.dart';
import 'package:training_center_xml/models/history.dart';
import 'package:training_center_xml/models/workouts.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'folders.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxFolders {
  factory TcxFolders.fromXmlElement(XmlElement element) =>
      _$TcxFoldersFromXmlElement(element);

  TcxFolders({
    this.history,
    this.workouts,
    this.courses,
  });

  @annotation.XmlElement(includeIfNull: false)
  TcxHistory? history;

  @annotation.XmlElement(includeIfNull: false)
  TcxWorkouts? workouts;

  @annotation.XmlElement(includeIfNull: false)
  TcxCourses? courses;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxFoldersBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxFoldersBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxFoldersToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxFoldersToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxFoldersToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
