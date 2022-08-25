import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

import 'tcx_abstract_source.dart';
import 'tcx_activity_lap.dart';
import 'tcx_sport.dart';

/// Represents a sportive activity.
class TcxActivity implements TcxSerializable {
  // Attributes
  static const String sportXmlAttribute = "Sport";
  /// The type of sport practiced. This field is required by the TCX schema definition.
  late TcxSport sport;

  // Children
  static const String idXmlTag = "Id";
  /// A unique datetime identifier for this activity. This field is required by the TCX schema definition.
  late DateTime id;
  static const String lapXmlTag = "Lap";
  /// The list of laps during this activity. This field is required not to be empty by the TCX schema definition.
  late List<TcxActivityLap> lap = []; // Cannot be empty
  static const String notesXmlTag = "Notes";
  /// Notes about this activity. This field is not required by the TCX schema definition.
  String? notes;
  static const String trainingXmlTag = "Training";
  //TcxTraining? training; // TODO
  static const String creatorXmlTag = "Creator";
  TcxAbstractSource? creator;
  static const String extensionsXmlTag = "Extensions";
  //Extensions? extensions; //TODO

  TcxActivity({
    TcxSport? sport,
    DateTime? id,
    List<TcxActivityLap>? lap,
    this.notes,
    //this.training,
    this.creator,
    //this.extensions,
  })  : sport = sport ?? TcxSports.other,
        id = id ?? DateTime.fromMillisecondsSinceEpoch(0),
        lap = lap ?? [];

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlAttribute> attributes = [
      XmlAttribute(XmlName(sportXmlAttribute), sport),
    ];
    List<XmlElement> children = [];

    children.add(
        XmlElement(XmlName(idXmlTag), [], [XmlText(id.toIso8601String())]));
    for (TcxActivityLap l in lap) {
      children.add(l.toXmlElement(XmlName(lapXmlTag)));
    }
    if (notes != null) {
      children.add(XmlElement(XmlName(notesXmlTag), [], [XmlText(notes!)]));
    }
    //TODO
    // if(training != null)
    // {
    //   children.add(training.toXmlElement(XmlName(trainingXmlTag)));
    // }
    if (creator != null) {
      children.add(creator!.toXmlElement(XmlName(lapXmlTag)));
    }

    return XmlElement(name, attributes, children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxActivity.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    if (xmlElement.attributes.length != 1 ||
        xmlElement.attributes.first.name.local != sportXmlAttribute) {
      error = true;
    } else {
      sport = xmlElement.attributes.first.value;
    }

    bool idInitialized = false;
    lap = [];
    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case idXmlTag:
          id = DateTime.parse(child.text);
          idInitialized = true;
          break;
        case lapXmlTag:
          lap.add(TcxActivityLap.fromXmlElement(child));
          break;
        case notesXmlTag:
          notes = child.text;
          break;
        case trainingXmlTag:
          break;
        case creatorXmlTag:
          creator = TcxAbstractSource.fromXmlElement(child);
          break;
        case extensionsXmlTag:
          break;
        default:
          error = true;
          break;
      }
    }
    error |= !idInitialized || lap.isEmpty || !TcxSports.values.contains(sport);

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxActivity."));
    }
  }
}
