import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

class TcxAbstractSource implements TcxSerializable {
  static const String nameXMLTag = "Name";
  String name;

  TcxAbstractSource({required this.name});

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    children.add(XmlElement(XmlName(nameXMLTag), [], [XmlText(this.name)]));
    return XmlElement(name, [], children);
  }
}
