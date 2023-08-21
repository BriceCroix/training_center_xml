import 'package:training_center_xml/models/cadence_value.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/models/position.dart';
import 'package:training_center_xml/models/sensor_state.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'trackpoint.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxTrackpoint {
  factory TcxTrackpoint.fromXmlElement(XmlElement element) =>
      _$TcxTrackpointFromXmlElement(element);

  TcxTrackpoint({
    required this.time,
    this.sensorState,
    this.extensions,
    this.distanceMeters,
    this.cadence,
    this.altitudeMeters,
    this.heartRateBpm,
    this.position,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  DateTime time;

  @annotation.XmlElement()
  TcxPosition? position;

  @annotation.XmlElement()
  double? altitudeMeters;

  @annotation.XmlElement()
  double? distanceMeters;

  @annotation.XmlElement()
  TcxHeartRateInBeatsPerMinute? heartRateBpm;

  @annotation.XmlElement()
  TcxCadenceValue? cadence;

  @annotation.XmlElement()
  TcxSensorState? sensorState;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrackpointBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrackpointBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrackpointToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrackpointToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrackpointToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
