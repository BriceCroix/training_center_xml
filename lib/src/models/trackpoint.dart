import 'package:training_center_xml/src/models/cadence_value.dart';
import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/src/models/position.dart';
import 'package:training_center_xml/src/models/sensor_state.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'trackpoint.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
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

  @annotation.XmlElement(includeIfNull: false)
  DateTime time;

  @annotation.XmlElement(includeIfNull: false)
  TcxPosition? position;

  @annotation.XmlElement(includeIfNull: false)
  double? altitudeMeters;

  @annotation.XmlElement(includeIfNull: false)
  double? distanceMeters;

  @annotation.XmlElement(includeIfNull: false)
  TcxHeartRateInBeatsPerMinute? heartRateBpm;

  @annotation.XmlElement(includeIfNull: false)
  TcxCadenceValue? cadence;

  @annotation.XmlElement(includeIfNull: false)
  TcxSensorState? sensorState;

  @annotation.XmlElement(includeIfNull: false)
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
