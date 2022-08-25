import 'package:xml/xml.dart';

/// An interface forcing Tcx classes to be convertible to XML.
abstract class TcxSerializable{
  XmlElement toXmlElement(XmlName name);
  // This constructor should be implemented event though the interface does not enforce it
  TcxSerializable.fromXmlElement(XmlElement element);
}