import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'quick_workout.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxQuickWorkout {
  factory TcxQuickWorkout.fromXmlElement(XmlElement element) =>
      _$TcxQuickWorkoutFromXmlElement(element);

  TcxQuickWorkout({
    required this.totalTimeSeconds,
    required this.distanceMeters,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  double totalTimeSeconds;

  @annotation.XmlElement()
  double distanceMeters;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxQuickWorkoutBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxQuickWorkoutBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxQuickWorkoutToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxQuickWorkoutToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxQuickWorkoutToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
