import 'package:training_center_xml/models/cadence_value.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/models/intensity.dart';
import 'package:training_center_xml/models/track.dart';
import 'package:training_center_xml/models/trigger_method.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_lap.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxActivityLap {
  factory TcxActivityLap.fromXmlElement(XmlElement element) =>
      _$TcxActivityLapFromXmlElement(element);

  TcxActivityLap({
    required this.totalTimeSeconds,
    required this.triggerMethod,
    required this.calories,
    required this.distanceMeters,
    required this.intensity,
    required this.startTime,
    this.extensions,
    this.notes,
    this.averageHeartRateBpm,
    this.cadence,
    this.maximumHeartRateBpm,
    this.maximumSpeed,
    this.track,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  double totalTimeSeconds;

  @annotation.XmlElement()
  double distanceMeters;

  @annotation.XmlElement()
  double? maximumSpeed;

  @annotation.XmlElement()
  int calories;

  @annotation.XmlElement()
  TcxHeartRateInBeatsPerMinute? averageHeartRateBpm;

  @annotation.XmlElement()
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBpm;

  @annotation.XmlElement()
  TcxIntensity intensity;

  @annotation.XmlElement()
  TcxCadenceValue? cadence;

  @annotation.XmlElement()
  TcxTriggerMethod triggerMethod;

  @annotation.XmlElement()
  List<TcxTrack>? track;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  DateTime startTime;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityLapBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityLapBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityLapToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
