import 'package:training_center_xml/model/tcx_heart_rate_value.dart';
import 'package:xml/xml.dart';

/// Represents a heartbeat frequency in Beats per minute.
class TcxHeartRateInBeatsPerMinute extends TcxHeartRateValue {
  static const valueXmlTag = "Value";
  /// Actual value, required by the tcx schema definition.
  late int value;

  TcxHeartRateInBeatsPerMinute({int? value}) : value = value ?? 0;

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [
      XmlElement(XmlName(valueXmlTag), [], [XmlText(value.toString())])
    ];
    return XmlElement(name, [], children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxHeartRateInBeatsPerMinute.fromXmlElement(XmlElement xmlElement) {
    if (xmlElement.children.length != 1 ||
        xmlElement.childElements.first.name.local != valueXmlTag) {
      throw (ArgumentError(
          "Invalid xmlElement in TcxHeartRateInBeatsPerMinute."));
    }
    value = int.parse(xmlElement.childElements.first.text);
  }
}
