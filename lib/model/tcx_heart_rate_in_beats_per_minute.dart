import 'package:training_center_xml/model/tcx_heart_rate_value.dart';
import 'package:xml/xml.dart';

class TcxHeartRateInBeatsPerMinute extends TcxHeartRateValue{
  static const valueXmlTag = "Value";
  int value;
  TcxHeartRateInBeatsPerMinute({required this.value});

  @override
  XmlElement toXmlElement(XmlName name){
    List<XmlElement> children = [
      XmlElement(XmlName(valueXmlTag), [], [XmlText(value.toString())])
    ];
    return XmlElement(name, [], children);
  }
}