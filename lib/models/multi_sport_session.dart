import 'package:training_center_xml/models/first_sport.dart';
import 'package:training_center_xml/models/next_sport.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'multi_sport_session.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxMultiSportSession {
  factory TcxMultiSportSession.fromXmlElement(XmlElement element) =>
      _$TcxMultiSportSessionFromXmlElement(element);

  TcxMultiSportSession({
    required this.id,
    required this.firstSport,
    this.notes,
    this.nextSport,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  DateTime id;

  @annotation.XmlElement(includeIfNull: false)
  TcxFirstSport firstSport;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxNextSport>? nextSport;

  @annotation.XmlElement(includeIfNull: false)
  String? notes;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxMultiSportSessionBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxMultiSportSessionBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportSessionToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportSessionToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportSessionToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
