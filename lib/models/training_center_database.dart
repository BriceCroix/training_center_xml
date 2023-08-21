import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/activity_list.dart';
import 'package:training_center_xml/models/course_list.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'training_center_database.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxTrainingCenterDatabase {
  factory TcxTrainingCenterDatabase.fromXmlElement(XmlElement element) =>
      _$TcxTrainingCenterDatabaseFromXmlElement(element);

  TcxTrainingCenterDatabase({
    this.extensions,
    this.activities,
    this.author,
    this.courses,
    //this.folders,
    //this.workouts,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  //@annotation.XmlElement()
  //TcxFolders? folders;

  @annotation.XmlElement()
  TcxActivityList? activities;

  //@annotation.XmlElement()
  //TcxWorkoutList? workouts;

  @annotation.XmlElement()
  TcxCourseList? courses;

  @annotation.XmlElement()
  TcxAbstractSource? author;

  @annotation.XmlElement()
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
