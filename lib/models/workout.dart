import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/abstract_step.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/sport.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workout.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
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

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  String name;

  /// Every stepId within a workout should be unique, as a consequence a maximum
  /// of 20 steps is allowed in a workout.
  @annotation.XmlElement()
  List<TcxAbstractStep> step;

  // Should be List<Date>?
  @annotation.XmlElement()
  List<DateTime>? scheduledOn;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  TcxAbstractSource? creator;

  @annotation.XmlElement()
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
