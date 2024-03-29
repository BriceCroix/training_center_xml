import 'package:training_center_xml/src/models/workout.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workout_list.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxWorkoutList {
  factory TcxWorkoutList.fromXmlElement(XmlElement element) =>
      _$TcxWorkoutListFromXmlElement(element);

  TcxWorkoutList({
    this.workout,
  });

  @annotation.XmlElement(includeIfNull: false)
  List<TcxWorkout>? workout;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutListBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutListBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutListToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutListToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutListToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
