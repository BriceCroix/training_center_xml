import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/name_key_reference.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'workout_folder.g.dart';

@annotation.XmlRootElement()
@annotation.XmlSerializable()
class TcxWorkoutFolder {
  factory TcxWorkoutFolder.fromXmlElement(XmlElement element) =>
      _$TcxWorkoutFolderFromXmlElement(element);

  TcxWorkoutFolder({
    required this.name,
    this.extensions,
    this.workoutNameRef,
    this.folder,
  });

  static const String namespace = namespaceTrainingCenterDatabaseV2;

  /// sub-folder names must be unique.
  @annotation.XmlElement()
  List<TcxWorkoutFolder>? folder;

  @annotation.XmlElement()
  List<TcxNameKeyReference>? workoutNameRef;

  @annotation.XmlElement()
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
