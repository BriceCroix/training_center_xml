import 'package:training_center_xml/models/plan.dart';
import 'package:training_center_xml/models/quick_workout.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'training.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxTraining {
  factory TcxTraining.fromXmlElement(XmlElement element) =>
      _$TcxTrainingFromXmlElement(element);

  TcxTraining({
    required this.virtualPartner,
    this.plan,
    this.quickWorkoutResults,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  TcxQuickWorkout? quickWorkoutResults;

  @annotation.XmlElement()
  TcxPlan? plan;

  @annotation.XmlAttribute()
  bool virtualPartner;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrainingBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrainingBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
