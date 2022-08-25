import 'package:training_center_xml/model/extensions/tcx_extension.dart';
import 'package:training_center_xml/training_center_xml.dart';
import 'package:xml/xml.dart';

import 'tcx_cadence_sensor_type.dart';
import 'tcx_extensions.dart';

class TcxActivityTrackPointExtension implements TcxExtension {
  static const String extensionName = "TPX";

  static const String extensionNamespaceXmlAttribute = "xmlns";
  static const String extensionNamespace = "http://www.garmin.com/xmlschemas/ActivityExtension/v2";
  // Attributes
  static const String cadenceSensorXmlAttribute = "CadenceSensor";
  TcxCadenceSensorType? cadenceSensor;

  // Children
  static const String speedXmlTag = "Speed";
  double? speed;
  static const String runCadenceXmlTag = "RunCadence";
  /// Bike Cadence should be stored in the field "cadence" of TcxTrackpoint.
  TcxCadenceValue? runCadence;
  static const String wattsXmlTag = "Watts";
  int? watts;
  static const String extensionsXmlTag = "Extensions";
  TcxExtensions? extensions;

  TcxActivityTrackPointExtension(
      {this.speed, this.runCadence, this.watts, this.extensions});

  @override
  String getExtensionName() {
    return extensionName;
  }

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlAttribute> attributes = [
      XmlAttribute(XmlName(extensionNamespaceXmlAttribute), extensionNamespace)
    ];
    if(cadenceSensor != null){
      attributes.add(XmlAttribute(XmlName(cadenceSensorXmlAttribute), cadenceSensor!));
    }
    List<XmlElement> children = [];
    if (speed != null) {
      children.add(XmlElement(XmlName(speedXmlTag), [], [XmlText(speed!.toString())]));
    }
    if (runCadence != null) {
      children.add(XmlElement(XmlName(runCadenceXmlTag), [], [XmlText(runCadence!.toString())]));
    }
    if (watts != null) {
      children.add(XmlElement(XmlName(wattsXmlTag), [], [XmlText(watts!.toString())]));
    }
    if (extensions != null) {
      children.add(extensions!.toXmlElement(XmlName(extensionsXmlTag)));
    }

    return XmlElement(name, attributes, children);
  }

  TcxActivityTrackPointExtension.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case cadenceSensorXmlAttribute:
          cadenceSensor = child.text;
          break;
        case speedXmlTag:
          speed = double.parse(child.text);
          break;
        case runCadenceXmlTag:
          runCadence = TcxCadenceValue.parse(child.text);
          break;
        case wattsXmlTag:
          watts = int.parse(child.text);
          break;
        case extensionsXmlTag:
          extensions = TcxExtensions.fromXmlElement(child);
        break;
        default:
          error = true;
          break;
      }
    }
    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxActivityTrackPointExtension."));
    }
  }
}