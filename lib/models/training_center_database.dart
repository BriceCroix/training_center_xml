import 'package:training_center_xml/models/abstract_source.dart';
import 'package:training_center_xml/models/activity_list.dart';
import 'package:training_center_xml/models/course_list.dart';
import 'package:training_center_xml/models/extensions.dart';
import 'package:training_center_xml/models/folders.dart';
import 'package:training_center_xml/models/workout_list.dart';
import 'package:training_center_xml/namespace.dart';
import 'package:training_center_xml/namespaces.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'training_center_database.g.dart';

@annotation.XmlRootElement(
  namespace: namespaceTrainingCenterDatabaseV2,
  name: 'TrainingCenterDatabase',
)
@annotation.XmlSerializable(fieldRename: annotation.FieldRename.pascal)
class TcxTrainingCenterDatabase {
  factory TcxTrainingCenterDatabase._fromXmlElement(XmlElement element) =>
      _$TcxTrainingCenterDatabaseFromXmlElement(element);

  /// Creates a new instance of tcx class providing a given xml String
  ///
  /// Example :
  /// ```dart
  /// TcxTrainingCenterDatabase.fromXmlString(
  /// '''<?xml version="1.0" encoding="UTF-8"?>
  /// <TrainingCenterDatabase
  ///     xsi:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd"
  ///     xmlns:ns3="http://www.garmin.com/xmlschemas/ActivityExtension/v2"
  ///     xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
  ///     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  ///     <Activities>
  ///         <Activity Sport="Biking">
  ///             <Id>2022-08-15T12:08:50Z</Id>
  ///             <Lap StartTime="2022-08-15T12:08:50Z">
  ///                 <TotalTimeSeconds>2888</TotalTimeSeconds>
  ///                 <DistanceMeters>13910.2</DistanceMeters>
  ///                 <MaximumSpeed>14.8</MaximumSpeed>
  ///                 <Calories>0</Calories>
  ///                 <Intensity>Active</Intensity>
  ///                 <TriggerMethod>Manual</TriggerMethod>
  ///                 <Track>
  ///                     <Trackpoint>
  ///                         <Time>2022-08-15T12:08:50Z</Time>
  ///                         <Position>
  ///                             <LatitudeDegrees>48.45684</LatitudeDegrees>
  ///                             <LongitudeDegrees>-1.5616</LongitudeDegrees>
  ///                         </Position>
  ///                         <AltitudeMeters>103.1</AltitudeMeters>
  ///                         <DistanceMeters>0.0</DistanceMeters>
  ///                         <Extensions>
  ///                             <TPX xmlns="http://www.garmin.com/xmlschemas/ActivityExtension/v2">
  ///                                 <Speed>0.0</Speed>
  ///                             </TPX>
  ///                         </Extensions>
  ///                     </Trackpoint>
  ///                     <Trackpoint>
  ///                         <Time>2022-08-15T12:56:58Z</Time>
  ///                         <Position>
  ///                             <LatitudeDegrees>48.478954</LatitudeDegrees>
  ///                             <LongitudeDegrees>-1.5951</LongitudeDegrees>
  ///                         </Position>
  ///                         <AltitudeMeters>102.3</AltitudeMeters>
  ///                         <DistanceMeters>13910.2</DistanceMeters>
  ///                         <Extensions>
  ///                             <TPX xmlns="http://www.garmin.com/xmlschemas/ActivityExtension/v2">
  ///                                 <Speed>0.7</Speed>
  ///                             </TPX>
  ///                         </Extensions>
  ///                     </Trackpoint>
  ///                 </Track>
  ///             </Lap>
  ///         </Activity>
  ///     </Activities>
  /// </TrainingCenterDatabase>
  /// '''
  /// );
  /// ```
  factory TcxTrainingCenterDatabase.fromXmlString(String xml) {
    final document = XmlDocument.parse(xml);
    return TcxTrainingCenterDatabase._fromXmlElement(document.rootElement);
  }

  TcxTrainingCenterDatabase({
    this.extensions,
    this.activities,
    this.author,
    this.courses,
    this.folders,
    this.workouts,
  });

  @annotation.XmlElement(includeIfNull: false)
  TcxFolders? folders;

  @annotation.XmlElement(includeIfNull: false)
  TcxActivityList? activities;

  @annotation.XmlElement(includeIfNull: false)
  TcxWorkoutList? workouts;

  @annotation.XmlElement(includeIfNull: false)
  TcxCourseList? courses;

  @annotation.XmlElement(includeIfNull: false)
  TcxAbstractSource? author;

  @annotation.XmlElement(includeIfNull: false)
  TcxExtensions? extensions;

  static const String _xmlVersionEncoding =
      '<?xml version="1.0" encoding="UTF-8"?>';

  @override
  String toString() => toXmlString();

  /// Converts tcx object to string in XML format, suitable to be written to a
  /// '.tcx' file.
  ///
  /// The parameters are passed to the XML formatter, their documentation is
  /// copied here for convenience :
  ///
  /// If [pretty] is set to `true` the output is nicely reformatted, otherwise
  /// the tree is emitted verbatim.
  ///
  /// The remaining options are used for pretty printing only:
  ///
  /// - The option [indent] defines the indention of nodes, by default nodes
  ///   are indented with 2 spaces.
  /// - The option [newLine] defines the printing of new lines, by default
  ///   the standard new-line `'\n'` character is used.
  /// - The option [level] customizes the initial indention level, by default
  ///   this is `0`.
  String toXmlString({
    bool pretty = false,
    int? level,
    String? indent,
    String newLine = '\n',
  }) {
    return _xmlVersionEncoding +
        newLine +
        XmlDocument(
          [_toXmlElement(namespaces: namespacesTcxTrainingCenterDatabase)],
        ).toXmlString(
          pretty: pretty,
          level: level,
          indent: indent,
          newLine: newLine,
        );
  }

  XmlElement _toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlElement(
      this,
      namespaces: namespaces,
    );
  }

  /// Reserved for internal use.
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$TcxTrainingCenterDatabaseBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
  }

  /// Reserved for internal use.
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlAttributes(
      this,
      namespaces: namespaces,
    );
  }

  /// Reserved for internal use.
  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    return _$TcxTrainingCenterDatabaseToXmlChildren(
      this,
      namespaces: namespaces,
    );
  }
}
