import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

class TcxAbstractSource implements TcxSerializable {
  static const String nameXMLTag = "Name";
  late String name;

  TcxAbstractSource({required this.name});

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    children.add(XmlElement(XmlName(nameXMLTag), [], [XmlText(this.name)]));
    return XmlElement(name, [], children);
  }

  TcxAbstractSource.fromXmlElement(XmlElement xmlElement) {
    if(xmlElement.children.length != 1 || xmlElement.childElements.first.name.local != nameXMLTag){
      throw(ArgumentError("Invalid xmlElement in TcxAbstractSource."));
    }
    name = xmlElement.childElements.first.text;
  }
}
