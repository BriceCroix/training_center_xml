import 'package:training_center_xml/models/activity_reference.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/week.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'history_folder.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxHistoryFolder {
  factory TcxHistoryFolder.fromXmlElement(XmlElement element) =>
      _$TcxHistoryFolderFromXmlElement(element);

  TcxHistoryFolder({
    required this.name,
    this.extensions,
    this.notes,
    this.activityRef,
    this.folder,
    this.week,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxHistoryFolder>? folder;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxActivityReference>? activityRef;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxWeek>? week;

  @annotation.XmlElement(includeIfNull: false)
  String? notes;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  String name;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHistoryFolderBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxHistoryFolderBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryFolderToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryFolderToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxHistoryFolderToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
