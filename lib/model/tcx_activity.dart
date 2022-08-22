import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

import 'tcx_abstract_source.dart';
import 'tcx_activity_lap.dart';
import 'tcx_sport.dart';

class TcxActivity implements TcxSerializable {
  // Attributes
  static const String sportXmlAttribute = "Sport";
  TcxSport sport;

  // Children
  static const String idXmlTag = "Id";
  DateTime id;
  static const String lapXmlTag = "Lap";
  List<TcxActivityLap> lap; // Cannot be empty
  static const String notesXmlTag = "Notes";
  String? notes;
  static const String trainingXmlTag = "Training";

  //TcxTraining? training; // TODO
  static const String creatorXmlTag = "Creator";
  TcxAbstractSource? creator;

  // Constructor
  TcxActivity(
      {required this.sport,
      required this.id,
      required this.lap,
      this.notes,
      //this.training,
      this.creator});

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
      children.add(XmlElement(
          XmlName(notesXmlTag), [], [XmlText(notes!)]));
    }
    //TODO
    // if(training != null)
    // {
    //   children.add(training.toXmlElement(XmlName(trainingXmlTag)));
    // }
    if(creator != null) {
      children.add(creator!.toXmlElement(XmlName(lapXmlTag)));
    }

    return XmlElement(name, attributes, children);
  }
}
