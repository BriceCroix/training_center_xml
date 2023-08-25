import 'package:training_center_xml/models/activity_reference.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/week.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'multi_sport_folder.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxMultiSportFolder {
  factory TcxMultiSportFolder.fromXmlElement(XmlElement element) =>
      _$TcxMultiSportFolderFromXmlElement(element);

  TcxMultiSportFolder({
    required this.name,
    this.extensions,
    this.notes,
    this.multisportActivityRef,
    this.folder,
    this.week,
  });

  @annotation.XmlElement(includeIfNull: false)
  List<TcxMultiSportFolder>? folder;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxActivityReference>? multisportActivityRef;

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
    _$TcxMultiSportFolderBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxMultiSportFolderBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportFolderToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportFolderToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxMultiSportFolderToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
