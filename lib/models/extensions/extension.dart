import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'extension.g.dart';

@annotation.XmlSerializable()
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
