import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

import 'tcx_activity.dart';

/// Represents a list of activities.
class TcxActivityList implements TcxSerializable {
  static const String activityXmlTag = "Activity";
  /// Actual list of activities, this field is not required by the TCX schema definition.
  List<TcxActivity> activity = []; // Can be empty
  static const String multiSportSessionXmlTag = "MultiSportSession";
  //List<TcxMultiSportSession> multiSportSession; // Can be empty //TODO

  TcxActivityList({
    List<TcxActivity>? activity,
    //List<TcxMultiSportSession>? multiSportSession,
  }) : activity = activity ?? []
  //multiSportSession = multiSportSession ?? []
  ;

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    for (TcxActivity a in activity) {
      children.add(a.toXmlElement(XmlName(activityXmlTag)));
    }
    //TODO
    // for (TcxMultiSportSession m in multiSportSession) {
    //   children.add(m.toXmlElement(XmlName(multiSportSessionXmlTag)));
    // }

    return XmlElement(name, [], children);
  }

  TcxActivityList.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case activityXmlTag:
          activity.add(TcxActivity.fromXmlElement(child));
          break;
        case multiSportSessionXmlTag:
          break;
        default:
          error = true;
          break;
      }
    }

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxActivity."));
    }
  }
}
