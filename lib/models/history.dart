import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/history_folder.dart';
import 'package:training_center_xml/models/multi_sport_folder.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'history.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxHistory {
  factory TcxHistory.fromXmlElement(XmlElement element) =>
      _$TcxHistoryFromXmlElement(element);

  TcxHistory({
    required this.running,
    required this.biking,
    required this.other,
    required this.multiSport,
    this.extensions,
  });

  @annotation.XmlElement(includeIfNull: false)
  TcxHistoryFolder running;

  @annotation.XmlElement(includeIfNull: false)
  TcxHistoryFolder biking;

  @annotation.XmlElement(includeIfNull: false)
  TcxHistoryFolder other;

  @annotation.XmlElement(includeIfNull: false)
  TcxMultiSportFolder multiSport;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHistoryBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHistoryBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
