import 'package:xml/xml.dart';

// TODO : manually add method
//  TcxExtension _$TcxExtensionFromXmlElement(XmlElement element) {
//   return TcxExtension();
// }
// That actually returns a subtype of TcxExtension, it could be generated,
// knowing all classes annotated with @XmlSerializable

abstract class TcxExtension {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  });

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  });

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  });

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  });

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  });
}
