import 'tcx_intensity.dart';
import 'tcx_serializable.dart';
import 'package:xml/xml.dart';
import 'tcx_heart_rate_in_beats_per_minute.dart';
import 'tcx_track.dart';
import 'tcx_trigger_method.dart';
import 'tcx_cadence_value.dart';

class TcxActivityLap implements TcxSerializable {
  // Children
  static const String totalTimeSecondsXmlTag = "TotalTimeSeconds";
  double totalTimeSeconds;
  static const String distanceMetersXmlTag = "DistanceMetersSeconds";
  double distanceMeters;
  static const String maximumSpeedMetersPerSecondXmlTag = "MaximumSpeed";
  double? maximumSpeedMetersPerSecond;
  static const String caloriesXmlTag = "Calories";
  double calories;
  static const String averageHeartRateBeatsPerMinuteXmlTag =
      "AverageHeartRateBpm";
  TcxHeartRateInBeatsPerMinute? averageHeartRateBeatsPerMinute;
  static const String maximumHeartRateBeatsPerMinuteXmlTag =
      "MaximumHeartRateBpm";
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBeatsPerMinute;
  static const String intensityXmlTag = "Intensity";
  TcxIntensity intensity;
  static const String cadenceXmlTag = "Cadence";
  TcxCadenceValue? cadence;
  static const String triggerMethodXmlTag = "TriggerMethod";
  TcxTriggerMethod triggerMethod;
  static const String trackXmlTag = "Track";
  List<TcxTrack> track = []; // Can be empty
  static const String notesXmlTag = "Notes";
  String? notes;

  TcxActivityLap(
      {required this.totalTimeSeconds,
      required this.distanceMeters,
      this.maximumSpeedMetersPerSecond,
      required this.calories,
      this.averageHeartRateBeatsPerMinute,
      this.maximumHeartRateBeatsPerMinute,
      required this.intensity,
      this.cadence,
      required this.triggerMethod,
      this.track = const [],
      this.notes});

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    children.add(XmlElement(XmlName(totalTimeSecondsXmlTag), [],
        [XmlText(totalTimeSeconds.toString())]));
    children.add(XmlElement(XmlName(distanceMetersXmlTag), [],
        [XmlText(distanceMeters.toString())]));
    if (maximumSpeedMetersPerSecond != null) {
      children.add(XmlElement(XmlName(maximumSpeedMetersPerSecondXmlTag), [],
          [XmlText(maximumSpeedMetersPerSecond.toString())]));
    }
    children.add(XmlElement(
        XmlName(caloriesXmlTag), [], [XmlText(calories.toString())]));
    if (averageHeartRateBeatsPerMinute != null) {
      children.add(averageHeartRateBeatsPerMinute!
          .toXmlElement(XmlName(averageHeartRateBeatsPerMinuteXmlTag)));
    }
    if (maximumHeartRateBeatsPerMinute != null) {
      children.add(maximumHeartRateBeatsPerMinute!
          .toXmlElement(XmlName(maximumHeartRateBeatsPerMinuteXmlTag)));
    }
    children
        .add(XmlElement(XmlName(intensityXmlTag), [], [XmlText(intensity)]));
    if (cadence != null) {
      children.add(XmlElement(
          XmlName(cadenceXmlTag), [], [XmlText(cadence.toString())]));
    }
    children.add(
        XmlElement(XmlName(triggerMethodXmlTag), [], [XmlText(triggerMethod)]));
    for (TcxTrack t in track) {
      children.add(t.toXmlElement(XmlName(trackXmlTag)));
    }
    if (notes != null) {
      children.add(XmlElement(XmlName(notesXmlTag), [], [XmlText(notes!)]));
    }

    return XmlElement(name, [], children);
  }
}
