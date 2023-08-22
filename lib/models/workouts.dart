import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/workout_folder.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workouts.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxWorkouts {
  factory TcxWorkouts.fromXmlElement(XmlElement element) =>
      _$TcxWorkoutsFromXmlElement(element);

  TcxWorkouts({
    required this.running,
    required this.biking,
    required this.other,
    this.extensions,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  /// sub-folder names must be unique.
  @annotation.XmlElement(includeIfNull: false)
  TcxWorkoutFolder running;

  /// sub-folder names must be unique.
  @annotation.XmlElement(includeIfNull: false)
  TcxWorkoutFolder biking;

  /// sub-folder names must be unique.
  @annotation.XmlElement(includeIfNull: false)
  TcxWorkoutFolder other;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutsBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutsBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutsToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutsToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutsToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
