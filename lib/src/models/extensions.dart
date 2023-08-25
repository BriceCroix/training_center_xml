import 'package:training_center_xml/src/models/extensions/activity_extension_v2/activity_lap_extension.dart';
import 'package:training_center_xml/src/models/extensions/activity_extension_v2/activity_trackpoint_extension.dart';
import 'package:training_center_xml/src/namespace.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'extensions.g.dart';

@annotation.XmlRootElement(namespace: namespaceTrainingCenterDatabaseV2)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxExtensions {
  factory TcxExtensions.fromXmlElement(XmlElement element) =>
      _$TcxExtensionsFromXmlElement(element);

  TcxExtensions({
    this.activityLapExtension,
    this.activityTrackpointExtension,
  });

  @annotation.XmlElement(name: 'LX', includeIfNull: false)
  List<TcxActivityLapExtension>? activityLapExtension;

  @annotation.XmlElement(name: 'TPX', includeIfNull: false)
  List<TcxActivityTrackpointExtension>? activityTrackpointExtension;

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxExtensionsBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxExtensionsBuildXmlElement(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxExtensionsToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxExtensionsToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxExtensionsToXmlElement(
      this,
      namespaces: namespaces,
    );
  }
}
