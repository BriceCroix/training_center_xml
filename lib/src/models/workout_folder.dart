import 'package:training_center_xml/src/models/extensions.dart';
import 'package:training_center_xml/src/models/name_key_reference.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workout_folder.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxWorkoutFolder {
  factory TcxWorkoutFolder.fromXmlElement(XmlElement element) =>
      _$TcxWorkoutFolderFromXmlElement(element);

  TcxWorkoutFolder({
    required this.name,
    this.extensions,
    this.workoutNameRef,
    this.folder,
  });

  /// sub-folder names must be unique.
  @annotation.XmlElement(includeIfNull: false)
  List<TcxWorkoutFolder>? folder;

  @annotation.XmlElement(includeIfNull: false)
  List<TcxNameKeyReference>? workoutNameRef;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  @annotation.XmlAttribute()
  String name;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutFolderBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxWorkoutFolderBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutFolderToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutFolderToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxWorkoutFolderToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
