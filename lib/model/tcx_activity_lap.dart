import 'tcx_intensity.dart';
import 'tcx_serializable.dart';
import 'package:xml/xml.dart';
import 'tcx_heart_rate_in_beats_per_minute.dart';
import 'tcx_track.dart';
import 'tcx_trigger_method.dart';
import 'tcx_cadence_value.dart';

class TcxActivityLap implements TcxSerializable {
  // Attributes
  static const String startTimeXmlAttribute = "StartTime";
  late DateTime startTime;

  // Children
  static const String totalTimeSecondsXmlTag = "TotalTimeSeconds";
  late double totalTimeSeconds;
  static const String distanceMetersXmlTag = "DistanceMeters";
  late double distanceMeters;
  static const String maximumSpeedMetersPerSecondXmlTag = "MaximumSpeed";
  double? maximumSpeedMetersPerSecond;
  static const String caloriesXmlTag = "Calories";
  late int calories;
  static const String averageHeartRateBeatsPerMinuteXmlTag =
      "AverageHeartRateBpm";
  TcxHeartRateInBeatsPerMinute? averageHeartRateBeatsPerMinute;
  static const String maximumHeartRateBeatsPerMinuteXmlTag =
      "MaximumHeartRateBpm";
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBeatsPerMinute;
  static const String intensityXmlTag = "Intensity";
  late TcxIntensity intensity;
  static const String cadenceXmlTag = "Cadence";
  TcxCadenceValue? cadence;
  static const String triggerMethodXmlTag = "TriggerMethod";
  late TcxTriggerMethod triggerMethod;
  static const String trackXmlTag = "Track";
  List<TcxTrack> track = []; // Can be empty
  static const String notesXmlTag = "Notes";
  String? notes;
  static const String extensionsXmlTag = "Extensions";
  //Extensions? extensions;//TODO

  TcxActivityLap(
      {required this.startTime,
      required this.totalTimeSeconds,
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
    List<XmlAttribute> attributes = [
      XmlAttribute(XmlName(startTimeXmlAttribute), startTime.toIso8601String()),
    ];

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

    return XmlElement(name, attributes, children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxActivityLap.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    if(xmlElement.attributes.length != 1 || xmlElement.attributes.first.name.local != startTimeXmlAttribute){
      error = true;
    }
    else{
      startTime = DateTime.parse(xmlElement.attributes.first.value);
    }

    bool totalTimeSecondsInitialized = false;
    bool distanceMetersInitialized = false;
    bool caloriesInitialized = false;
    bool intensityInitialized = false;
    bool triggerMethodInitialized = false;
    track = [];
    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case totalTimeSecondsXmlTag:
          totalTimeSeconds = double.parse(child.text);
          totalTimeSecondsInitialized = true;
          break;
        case distanceMetersXmlTag:
          distanceMeters = double.parse(child.text);
          distanceMetersInitialized = true;
          break;
        case maximumSpeedMetersPerSecondXmlTag:
          maximumSpeedMetersPerSecond = double.parse(child.text);
          break;
        case caloriesXmlTag:
          calories = int.parse(child.text);
          caloriesInitialized = true;
          break;
        case averageHeartRateBeatsPerMinuteXmlTag:
          averageHeartRateBeatsPerMinute =
              TcxHeartRateInBeatsPerMinute.fromXmlElement(child);
          break;
        case maximumHeartRateBeatsPerMinuteXmlTag:
          maximumHeartRateBeatsPerMinute =
              TcxHeartRateInBeatsPerMinute.fromXmlElement(child);
          break;
        case intensityXmlTag:
          intensity = child.text;
          intensityInitialized = true;
          break;
        case triggerMethodXmlTag:
          triggerMethod = child.text;
          triggerMethodInitialized = true;
          break;
        case trackXmlTag:
          track.add(TcxTrack.fromXmlElement(child));
          break;
        case notesXmlTag:
          notes = child.text;
          break;
        case extensionsXmlTag:
          break;
        default:
          error = true;
          break;
      }
    }
    error |= !totalTimeSecondsInitialized ||
        !distanceMetersInitialized ||
        !caloriesInitialized ||
        !intensityInitialized ||
        !triggerMethodInitialized ||
        !TcxTriggerMethods.values.contains(triggerMethod) ||
        !TcxIntensities.values.contains(intensity);

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxActivityLap."));
    }
  }
}
