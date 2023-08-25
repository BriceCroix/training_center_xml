import 'package:training_center_xml/src/models/abstract_source.dart';
import 'package:training_center_xml/src/models/abstract_step.dart';
import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/sport.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workout.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxWorkout {
  factory TcxWorkout.fromXmlElement(XmlElement element) =>
      _$TcxWorkoutFromXmlElement(element);

  TcxWorkout({
    required this.name,
    required this.step,
    required this.sport,
    this.scheduledOn,
    this.extensions,
    this.notes,
    this.creator,
  });

  @annotation.XmlElement(includeIfNull: false)
  String name;

  /// Every stepId within a workout should be unique, as a consequence a maximum
  /// of 20 steps is allowed in a workout.
  @annotation.XmlElement(includeIfNull: false)
  List<TcxAbstractStep> step;

  // Should be List<Date>?
  @annotation.XmlElement(includeIfNull: false)
  List<DateTime>? scheduledOn;

  @annotation.XmlElement(includeIfNull: false)
  String? notes;

  @annotation.XmlElement(includeIfNull: false)
  TcxAbstractSource? creator;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  TcxSport sport;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
