import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

import 'tcx_abstract_source.dart';
import 'tcx_activity_lap.dart';
import 'tcx_sport.dart';

class TcxActivity implements TcxSerializable {
  // Attributes
  static const String sportXmlAttribute = "Sport";
  late TcxSport sport;

  // Children
  static const String idXmlTag = "Id";
  late DateTime id;
  static const String lapXmlTag = "Lap";
  late List<TcxActivityLap> lap = []; // Cannot be empty
  static const String notesXmlTag = "Notes";
  String? notes;
  static const String trainingXmlTag = "Training";
  //TcxTraining? training; // TODO
  static const String creatorXmlTag = "Creator";
  TcxAbstractSource? creator;
  static const String extensionsXmlTag = "Extensions";
  //Extensions? extensions; //TODO

  TcxActivity({
    required this.sport,
    required this.id,
    required this.lap,
    this.notes,
    //this.training,
    this.creator,
    //this.extensions,
  });

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

    if(xmlElement.attributes.length != 1 || xmlElement.attributes.first.name.local != sportXmlAttribute){
      error = true;
    }
    else{
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
          creator =TcxAbstractSource.fromXmlElement(child);
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
