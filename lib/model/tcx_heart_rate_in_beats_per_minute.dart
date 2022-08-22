import 'package:training_center_xml/model/tcx_heart_rate_value.dart';
import 'package:xml/xml.dart';

class TcxHeartRateInBeatsPerMinute extends TcxHeartRateValue{
  static const valueXmlTag = "Value";
  late int value;
  TcxHeartRateInBeatsPerMinute({required this.value});

  @override
  XmlElement toXmlElement(XmlName name){
    List<XmlElement> children = [
      XmlElement(XmlName(valueXmlTag), [], [XmlText(value.toString())])
    ];
    return XmlElement(name, [], children);
  }

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxHeartRateInBeatsPerMinute.fromXmlElement(XmlElement xmlElement) {
    if(xmlElement.children.length != 1 || xmlElement.childElements.first.name.local != valueXmlTag){
      throw(ArgumentError("Invalid xmlElement in TcxHeartRateInBeatsPerMinute."));
    }
    value = int.parse(xmlElement.childElements.first.text);
  }
}