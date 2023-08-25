import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_reference.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxActivityReference {
  factory TcxActivityReference.fromXmlElement(XmlElement element) =>
      _$TcxActivityReferenceFromXmlElement(element);

  TcxActivityReference({
    required this.id,
  });

  @annotation.XmlElement(includeIfNull: false)
  DateTime id;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityReferenceBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityReferenceBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityReferenceToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityReferenceToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityReferenceToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
