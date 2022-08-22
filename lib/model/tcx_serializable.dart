import 'package:xml/xml.dart';

abstract class TcxSerializable{
  XmlElement toXmlElement(XmlName name);
  // This constructor should be implemented event though the interface does not enforce it
  TcxSerializable.fromXmlElement(XmlElement element);
}