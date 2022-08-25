import 'package:training_center_xml/model/tcx_heart_rate_in_beats_per_minute.dart';
import 'package:training_center_xml/model/tcx_position.dart';
import 'package:training_center_xml/model/tcx_sensor_state.dart';
import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:training_center_xml/model/tcx_cadence_value.dart';
import 'package:xml/xml.dart';

/// Represents a trackpoint through which user passed during a sport session.
class TcxTrackpoint implements TcxSerializable {
  static const String timeXmlTag = "Time";
  /// Timestamp of this trackpoint. This field is required by the TCX schema definition.
  late DateTime time;

  static const String positionXmlTag = "Position";
  /// Position on a map of this trackpoint. This field is not required by the TCX schema definition.
  TcxPosition? position;
  static const String altitudeMetersXmlTag = "AltitudeMeters";
  /// Altitude in meters of this trackpoint. This field is not required by the TCX schema definition.
  double? altitudeMeters;
  static const String distanceMetersXmlTag = "DistanceMeters";
  /// Distance in meters between starting point and this trackpoint. This field is not required by the TCX schema definition.
  double? distanceMeters;
  static const String heartRateBeatsPerMinuteXmlTag = "HeartRateBpm";
  /// HeartBeat Frequency of user at this trackpoint. This field is not required by the TCX schema definition.
  TcxHeartRateInBeatsPerMinute? heartRateBeatsPerMinute;
  static const String cadenceXmlTag = "Cadence";
  /// Cadence of user at this trackpoint. This field is not required by the TCX schema definition.
  TcxCadenceValue? cadence;
  static const String sensorStateXmlTag = "SensorState";
  /// State of sensor at this trackpoint. This field is not required by the TCX schema definition.
  TcxSensorState? sensorState;
  static const String extensionsXmlTag = "Extensions";
  //TcxExtension? extensions; // TODO

  TcxTrackpoint(
      {DateTime? time,
      this.position,
      this.altitudeMeters,
      this.distanceMeters,
      this.heartRateBeatsPerMinute,
      this.cadence,
      this.sensorState}) : time = time ?? DateTime(0);

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
      children
          .add(XmlElement(XmlName(cadenceXmlTag), [], [XmlText(sensorState!)]));
    }

    return XmlElement(name, [], children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxTrackpoint.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    bool timeInitialized = false;
    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case timeXmlTag:
          time = DateTime.parse(child.text);
          timeInitialized = true;
          break;
        case positionXmlTag:
          position = TcxPosition.fromXmlElement(child);
          break;
        case altitudeMetersXmlTag:
          altitudeMeters = double.parse(child.text);
          break;
        case distanceMetersXmlTag:
          distanceMeters = double.parse(child.text);
          break;
        case heartRateBeatsPerMinuteXmlTag:
          heartRateBeatsPerMinute =
              TcxHeartRateInBeatsPerMinute.fromXmlElement(child);
          break;
        case cadenceXmlTag:
          cadence = TcxCadenceValue.parse(child.text);
          break;
        case sensorStateXmlTag:
          sensorState = child.text;
          break;
        case extensionsXmlTag:
          break;
        default:
          error = true;
          break;
      }
    }
    error = error || !timeInitialized;
    if (sensorState != null) {
      error |= !TcxSensorStates.values.contains(sensorState);
    }

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxTrackpoint."));
    }
  }
}
