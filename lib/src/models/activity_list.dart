import 'package:training_center_xml/src/models/activity.dart';
import 'package:training_center_xml/src/models/multi_sport_session.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_list.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxActivityList {
  factory TcxActivityList.fromXmlElement(XmlElement element) =>
      _$TcxActivityListFromXmlElement(element);

  TcxActivityList({
    this.activity,
    this.multiSportSession,
  });

  @annotation.XmlElement(includeIfNull: false)
  List<TcxActivity>? activity;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxMultiSportSession>? multiSportSession;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityListBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityListBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityListToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityListToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityListToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
