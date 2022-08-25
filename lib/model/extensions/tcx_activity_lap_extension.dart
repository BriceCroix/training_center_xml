import 'package:training_center_xml/model/extensions/tcx_extension.dart';
import 'package:training_center_xml/training_center_xml.dart';
import 'package:xml/xml.dart';

import 'tcx_extensions.dart';

class TcxActivityLapExtension implements TcxExtension {
  static const String extensionName = "LX";

  static const String extensionNamespaceXmlAttribute = "xmlns";
  static const String extensionNamespace = "http://www.garmin.com/xmlschemas/ActivityExtension/v2";

  // Children
  static const String averageSpeedXmlTag = "AvgSpeed";
  double? averageSpeed;
  static const String maxBikeCadenceXmlTag = "MaxBikeCadence";
  TcxCadenceValue? maxBikeCadence;
  static const String averageRunCadenceXmlTag = "AvgRunCadence";
  /// AvgBikeCadence is stored in the TcxActivityLap Cadence field.
  TcxCadenceValue? averageRunCadence;
  static const String maxRunCadenceXmlTag = "MaxRunCadence";
  TcxCadenceValue? maxRunCadence;
  static const String stepsXmlTag = "Steps";
  int? steps;
  static const String averageWattsXmlTag = "AvgWatts";
  int? averageWatts;
  static const String maxWattsXmlTag = "MaxWatts";
  int? maxWatts;
  static const String extensionsXmlTag = "Extensions";
  TcxExtensions? extensions;

  TcxActivityLapExtension({this.averageSpeed,
    this.maxBikeCadence,
    this.averageRunCadence,
    this.maxRunCadence,
    this.steps,
    this.averageWatts,
    this.maxWatts,
    this.extensions});

  @override
  String getExtensionName() {
    return extensionName;
  }

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlAttribute> attributes = [
      XmlAttribute(XmlName(extensionNamespaceXmlAttribute), extensionNamespace)
    ];

    List<XmlElement> children = [];
    if (averageSpeed != null) {
      children.add(
          XmlElement(XmlName(averageSpeedXmlTag), [], [XmlText(averageSpeed!.toString())]));
    }
    if (maxBikeCadence != null) {
      children.add(
          XmlElement(XmlName(maxBikeCadenceXmlTag), [], [XmlText(maxBikeCadence!.toString())]));
    }
    if (averageRunCadence != null) {
      children.add(
          XmlElement(XmlName(averageRunCadenceXmlTag), [], [XmlText(averageRunCadence!.toString())]));
    }
    if (maxRunCadence != null) {
      children.add(XmlElement(
          XmlName(maxRunCadenceXmlTag), [], [XmlText(maxRunCadence!.toString())]));
    }
    if (steps != null) {
      children.add(
          XmlElement(XmlName(stepsXmlTag), [], [XmlText(steps!.toString())]));
    }
    if (averageWatts != null) {
      children.add(
          XmlElement(XmlName(averageWattsXmlTag), [], [XmlText(averageWatts!.toString())]));
    }
    if (maxWatts != null) {
      children.add(
          XmlElement(XmlName(maxWattsXmlTag), [], [XmlText(maxWatts!.toString())]));
    }
    if (extensions != null) {
      children.add(extensions!.toXmlElement(XmlName(extensionsXmlTag)));
    }

    return XmlElement(name, attributes, children);
  }

  TcxActivityLapExtension.fromXmlElement(XmlElement xmlElement) {
    bool error = false;

    for (XmlElement child in xmlElement.childElements) {
      switch (child.name.local) {
        case averageSpeedXmlTag:
          averageSpeed = double.parse(child.text);
          break;
        case maxBikeCadenceXmlTag:
          maxBikeCadence = TcxCadenceValue.parse(child.text);
          break;
        case averageRunCadenceXmlTag:
          averageRunCadence = TcxCadenceValue.parse(child.text);
          break;
        case maxRunCadenceXmlTag:
          maxRunCadence = TcxCadenceValue.parse(child.text);
          break;
        case stepsXmlTag:
          steps = int.parse(child.text);
          break;
        case averageWattsXmlTag:
          averageWatts = int.parse(child.text);
          break;
        case maxWattsXmlTag:
          maxWatts = int.parse(child.text);
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
      throw (ArgumentError(
          "Invalid xmlElement in TcxActivityLapExtension."));
    }
  }
}