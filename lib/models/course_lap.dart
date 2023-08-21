import 'package:training_center_xml/models/cadence_value.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/models/intensity.dart';
import 'package:training_center_xml/models/position.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course_lap.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxCourseLap {
  factory TcxCourseLap.fromXmlElement(XmlElement element) =>
      _$TcxCourseLapFromXmlElement(element);

  TcxCourseLap({
    required this.totalTimeSeconds,
    required this.distanceMeters,
    required this.intensity,
    this.cadence,
    this.extensions,
    this.maximumHeartRateBpm,
    this.averageHeartRateBpm,
    this.beginAltitudeMeters,
    this.beginPosition,
    this.endAltitudeMeters,
    this.endPosition,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  double totalTimeSeconds;

  @annotation.XmlElement()
  double distanceMeters;

  @annotation.XmlElement()
  TcxPosition? beginPosition;

  @annotation.XmlElement()
  double? beginAltitudeMeters;

  @annotation.XmlElement()
  TcxPosition? endPosition;

  @annotation.XmlElement()
  double? endAltitudeMeters;

  @annotation.XmlElement()
  TcxHeartRateInBeatsPerMinute? averageHeartRateBpm;

  @annotation.XmlElement()
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBpm;

  @annotation.XmlElement()
  TcxIntensity intensity;

  @annotation.XmlElement()
  TcxCadenceValue? cadence;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseLapBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxCourseLapBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseLapToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseLapToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxCourseLapToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
