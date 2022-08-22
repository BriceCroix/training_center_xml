import 'package:xml/xml.dart';
import 'tcx_serializable.dart';
import 'tcx_trackpoint.dart';

class TcxTrack implements TcxSerializable {
  static const trackpointXmlTag = "Trackpoint";
  late List<TcxTrackpoint> trackpoint = const []; // Cannot be empty

  /// Throws [ArgumentError] if given list of Trackpoint is empty.
  TcxTrack({required this.trackpoint}) {
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

  /// Throws an [ArgumentError] if cannot find valid children.
  TcxTrack.fromXmlElement(XmlElement xmlElement) {
    bool error = false;
    trackpoint = [];
    for (XmlElement child in xmlElement.childElements) {
      if (child.name.local == trackpointXmlTag) {
        trackpoint.add(TcxTrackpoint.fromXmlElement(child));
      } else {
        error = true;
      }
    }
    error |= trackpoint.isEmpty;

    if (error) {
      throw (ArgumentError("Invalid xmlElement in TcxTrack."));
    }
  }
}
