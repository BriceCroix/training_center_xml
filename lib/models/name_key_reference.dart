import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'name_key_reference.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxNameKeyReference {
  factory TcxNameKeyReference.fromXmlElement(XmlElement element) =>
      _$TcxNameKeyReferenceFromXmlElement(element);

  TcxNameKeyReference({
    required this.id,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  String id;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxNameKeyReferenceBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxNameKeyReferenceBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNameKeyReferenceToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNameKeyReferenceToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxNameKeyReferenceToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
