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
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
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

  @annotation.XmlElement(includeIfNull: false)
  double totalTimeSeconds;

  @annotation.XmlElement(includeIfNull: false)
  double distanceMeters;

  @annotation.XmlElement(includeIfNull: false)
  TcxPosition? beginPosition;

  @annotation.XmlElement(includeIfNull: false)
  double? beginAltitudeMeters;

  @annotation.XmlElement(includeIfNull: false)
  TcxPosition? endPosition;

  @annotation.XmlElement(includeIfNull: false)
  double? endAltitudeMeters;

  @annotation.XmlElement(includeIfNull: false)
  TcxHeartRateInBeatsPerMinute? averageHeartRateBpm;

  @annotation.XmlElement(includeIfNull: false)
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBpm;

  @annotation.XmlElement(includeIfNull: false)
  TcxIntensity intensity;

  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? cadence;

  @annotation.XmlElement(includeIfNull: false)
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
