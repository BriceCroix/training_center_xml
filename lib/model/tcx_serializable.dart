import 'package:xml/xml.dart';

abstract class TcxSerializable{
  XmlElement toXmlElement(XmlName name);
  TcxSerializable.fromXmlElement(XmlElement element);
}