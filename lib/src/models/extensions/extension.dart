import 'package:xml/xml.dart';

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
