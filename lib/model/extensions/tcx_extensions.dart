import 'package:training_center_xml/model/extensions/tcx_activity_lap_extension.dart';
import 'package:training_center_xml/model/extensions/tcx_activity_trackpoint_extension.dart';
import 'package:training_center_xml/model/extensions/tcx_extension.dart';
import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';

class TcxExtensions implements TcxSerializable {
  static const Map<String, Type> supportedExtensions = {"TPX":TcxActivityTrackPointExtension};

  /// Extension objects. TCX schema definition allows for an empty list.
  List<TcxExtension> extension;

  TcxExtensions({List<TcxExtension>? extension}) : extension = extension ?? [];

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    for(TcxExtension e in extension){
      children.add(e.toXmlElement(XmlName(e.getExtensionName())));
    }
    return XmlElement(name, [], children);
  }

  TcxExtensions.fromXmlElement(XmlElement xmlElement) : extension = []{
    //TODO : add all supported extensions here
    for (XmlElement child in xmlElement.childElements) {
      switch(child.name.local){
        case TcxActivityTrackPointExtension.extensionName:
          extension.add(TcxActivityTrackPointExtension.fromXmlElement(child));
          break;
        case TcxActivityLapExtension.extensionName:
          extension.add(TcxActivityLapExtension.fromXmlElement(child));
          break;
      }
    }
  }
}
