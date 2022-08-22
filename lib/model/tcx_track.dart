import 'package:xml/xml.dart';
import 'tcx_serializable.dart';
import 'tcx_trackpoint.dart';

class TcxTrack implements TcxSerializable{
  static const trackpointXmlTag = "Trackpoint";

  /// List of all trackpoints, cannot be empty.
  List<TcxTrackpoint> trackpoint;

  /// Throws [ArgumentError] if given list of Trackpoint is empty.
  TcxTrack(this.trackpoint) {
    if (trackpoint.isEmpty) {
      throw ArgumentError('List of Trackpoint cannot be empty.');
    }
  }

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlElement> children = [];
    for (TcxTrackpoint tp in trackpoint) {
      children.add(tp.toXmlElement(XmlName(trackpointXmlTag)));
    }

    return XmlElement(name, [], children);
  }
}
