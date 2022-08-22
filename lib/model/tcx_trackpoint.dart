import 'package:training_center_xml/model/tcx_heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/model/tcx_position.dart';
import 'package:training_center_xml/model/tcx_sensor_state.dart';
import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:training_center_xml/model/tcx_cadence_value.dart';
import 'package:xml/xml.dart';

class TcxTrackpoint implements TcxSerializable{
  static const String timeXmlTag = "Time";
  DateTime time;

  static const String positionXmlTag = "Position";
  TcxPosition? position;
  static const String altitudeMetersXmlTag = "AltitudeMeters";
  double? altitudeMeters;
  static const String distanceMetersXmlTag = "DistanceMeters";
  double? distanceMeters;
  static const String heartRateBeatsPerMinuteXmlTag = "HeartRateBpm";
  TcxHeartRateInBeatsPerMinute? heartRateBeatsPerMinute;
  static const String cadenceXmlTag = "Cadence";
  TcxCadenceValue? cadence;
  static const String sensorStateXmlTag = "SensorState";
  TcxSensorState? sensorState;

  TcxTrackpoint(
      {required this.time,
      this.position,
      this.altitudeMeters,
      this.distanceMeters,
      this.heartRateBeatsPerMinute,
      this.cadence,
      this.sensorState});

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    children.add(
        XmlElement(XmlName(timeXmlTag), [], [XmlText(time.toIso8601String())]));
    if (position != null) {
      children.add(position!.toXmlElement(XmlName(positionXmlTag)));
    }
    if (altitudeMeters != null) {
      children.add(XmlElement(XmlName(altitudeMetersXmlTag), [],
          [XmlText(altitudeMeters!.toString())]));
    }
    if (distanceMeters != null) {
      children.add(XmlElement(XmlName(distanceMetersXmlTag), [],
          [XmlText(distanceMeters!.toString())]));
    }
    if (heartRateBeatsPerMinute != null) {
      children.add(heartRateBeatsPerMinute!
          .toXmlElement(XmlName(heartRateBeatsPerMinuteXmlTag)));
    }
    if (cadence != null) {
      children.add(XmlElement(
          XmlName(cadenceXmlTag), [], [XmlText(cadence!.toString())]));
    }
    if (sensorState != null) {
      children.add(XmlElement(
          XmlName(cadenceXmlTag), [], [XmlText(sensorState!)]));
    }

    return XmlElement(name, [], children);
  }
}
