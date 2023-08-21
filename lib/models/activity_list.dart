import 'package:training_center_xml/models/activity.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity_list.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxActivityList {
  factory TcxActivityList.fromXmlElement(XmlElement element) =>
      _$TcxActivityListFromXmlElement(element);

  TcxActivityList({
    this.activity,
    //this.multiSportSession,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  List<TcxActivity>? activity;

  // @annotation.XmlElement()
  // List<TcxMultiSportSession>? multiSportSession;

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
