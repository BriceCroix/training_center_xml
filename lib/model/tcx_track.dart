import 'package:xml/xml.dart';
import 'tcx_serializable.dart';
import 'tcx_trackpoint.dart';

/// Represents a track followed during a sport session.
class TcxTrack implements TcxSerializable {
  static const trackpointXmlTag = "Trackpoint";
  /// List of all trackpoints of this track. This field is required not to be empty by the TCX schema definition.
  late List<TcxTrackpoint> trackpoint = []; // Cannot be empty

  TcxTrack({List<TcxTrackpoint>? trackpoint}): trackpoint = trackpoint ?? [];

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
