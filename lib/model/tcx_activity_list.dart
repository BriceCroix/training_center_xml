import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

import 'tcx_activity.dart';

class TcxActivityList implements TcxSerializable {
  static const String activityXmlTag = "Activity";
  List<TcxActivity> activity = []; // Can be empty
  static const String multiSportSessionXmlTag = "MultiSportSession";
  //List<TcxMultiSportSession> multiSportSession; // Can be empty //TODO

  TcxActivityList({
    this.activity = const [],
    //this.multiSportSession = const [],
  });

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
}