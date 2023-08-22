import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/activity_list.dart';
import 'package:training_center_xml/models/course_list.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/folders.dart';
import 'package:training_center_xml/models/workout_list.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'training_center_database.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxTrainingCenterDatabase {
  factory TcxTrainingCenterDatabase.fromXmlElement(XmlElement element) =>
      _$TcxTrainingCenterDatabaseFromXmlElement(element);

  TcxTrainingCenterDatabase({
    this.extensions,
    this.activities,
    this.author,
    this.courses,
    this.folders,
    this.workouts,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  TcxFolders? folders;

  @annotation.XmlElement(includeIfNull: false)
  TcxActivityList? activities;

  @annotation.XmlElement(includeIfNull: false)
  TcxWorkoutList? workouts;

  @annotation.XmlElement(includeIfNull: false)
  TcxCourseList? courses;

  @annotation.XmlElement(includeIfNull: false)
  TcxAbstractSource? author;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrainingCenterDatabaseBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrainingCenterDatabaseBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
