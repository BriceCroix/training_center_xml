import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/activity_lap.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/sport.dart';
import 'package:training_center_xml/models/training.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'activity.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxActivity {
  factory TcxActivity.fromXmlElement(XmlElement element) =>
      _$TcxActivityFromXmlElement(element);

  TcxActivity({
    required this.id,
    required this.lap,
    required this.sport,
    this.extensions,
    this.creator,
    this.notes,
    this.training,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement()
  DateTime id;

  @annotation.XmlElement()
  List<TcxActivityLap> lap;

  @annotation.XmlElement()
  String? notes;

  @annotation.XmlElement()
  TcxTraining? training;

  @annotation.XmlElement()
  TcxAbstractSource? creator;

  @annotation.XmlElement()
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  TcxSport sport;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxActivityBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxActivityToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}