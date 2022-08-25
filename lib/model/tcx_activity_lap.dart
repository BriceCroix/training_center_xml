import 'extensions/tcx_extensions.dart';
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
  /// Datetime of the beginning of this lap. This attribute is required by the TCX schema definition.
  late DateTime startTime;

  // Children
  static const String totalTimeSecondsXmlTag = "TotalTimeSeconds";
  /// Total duration of this lap in seconds. This field is required by the TCX schema definition.
  late double totalTimeSeconds;
  static const String distanceMetersXmlTag = "DistanceMeters";
  /// Total distance of this lap in meters. This field is required by the TCX schema definition.
  late double distanceMeters;
  static const String maximumSpeedMetersPerSecondXmlTag = "MaximumSpeed";
  /// Maximum speed reached during this lap in meters per second. This field is not required by the TCX schema definition.
  double? maximumSpeedMetersPerSecond;
  static const String caloriesXmlTag = "Calories";
  /// Number of calories spent during this lap. This field is required by the TCX schema definition.
  late int calories;
  static const String averageHeartRateBeatsPerMinuteXmlTag =
      "AverageHeartRateBpm";
  /// Average heartbeat frequency during this lap. This field is not required by the TCX schema definition.
  TcxHeartRateInBeatsPerMinute? averageHeartRateBeatsPerMinute;
  static const String maximumHeartRateBeatsPerMinuteXmlTag =
      "MaximumHeartRateBpm";
  /// Maximum heartbeat frequency reached during this lap. This field is not required by the TCX schema definition.
  TcxHeartRateInBeatsPerMinute? maximumHeartRateBeatsPerMinute;
  static const String intensityXmlTag = "Intensity";
  /// Intensity of this lap. This field is required by the TCX schema definition.
  late TcxIntensity intensity;
  static const String cadenceXmlTag = "Cadence";
  /// Cadence of this lap. This field is not required by the TCX schema definition.
  TcxCadenceValue? cadence;
  static const String triggerMethodXmlTag = "TriggerMethod";
  /// Method used to trigger this lap. This field is required by the TCX schema definition.
  late TcxTriggerMethod triggerMethod;
  static const String trackXmlTag = "Track";
  /// List of tracks used during this lap. This field is not required by the TCX schema definition.
  List<TcxTrack> track = []; // Can be empty
  static const String notesXmlTag = "Notes";
  /// Notes about this lap. This field is not required by the TCX schema definition.
  String? notes;
  static const String extensionsXmlTag = "Extensions";
  /// Extensions of the TCX schema definition. This field is not required by the TCX schema definition.
  TcxExtensions? extensions;

  TcxActivityLap(
      {DateTime? startTime,
      double? totalTimeSeconds,
      double? distanceMeters,
      this.maximumSpeedMetersPerSecond,
      int? calories,
      this.averageHeartRateBeatsPerMinute,
      this.maximumHeartRateBeatsPerMinute,
      TcxIntensity? intensity,
      this.cadence,
      TcxTriggerMethod? triggerMethod,
      List<TcxTrack>? track,
      this.notes,
      this.extensions})
      : startTime = startTime ?? DateTime(0),
        totalTimeSeconds = totalTimeSeconds ?? 0,
        distanceMeters = distanceMeters ?? 0,
        calories = calories ?? 0,
        intensity = intensity ?? TcxIntensities.active,
        triggerMethod = TcxTriggerMethods.manual,
        track = track ?? [];

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
    if (extensions != null) {
      children.add(extensions!
          .toXmlElement(XmlName(extensionsXmlTag)));
    }

    return XmlElement(name, attributes, children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxActivityLap.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    if (xmlElement.attributes.length != 1 ||
        xmlElement.attributes.first.name.local != startTimeXmlAttribute) {
      error = true;
    } else {
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
          extensions = TcxExtensions.fromXmlElement(child);
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
