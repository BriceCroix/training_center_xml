import 'package:training_center_xml/model/tcx_serializable.dart';
import 'package:xml/xml.dart';
import 'tcx_abstract_source.dart';
import 'tcx_activity_list.dart';

/// Root class of the TCX file format
class TcxTrainingCenterDatabase implements TcxSerializable {
  static const String rootXmlTag = "TrainingCenterDatabase";

  static const Map<String, String> tcxAttributes = {
    "xsi:schemaLocation":
        "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd",
    "xmlns:ns5": "http://www.garmin.com/xmlschemas/ActivityGoals/v1",
    "xmlns:ns3": "http://www.garmin.com/xmlschemas/ActivityExtension/v2",
    "xmlns:ns2": "http://www.garmin.com/xmlschemas/UserProfile/v2",
    "xmlns": "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2",
    "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
    "xmlns:ns4": "http://www.garmin.com/xmlschemas/ProfileExtension/v1"
  };
  static const String foldersXmlTag = "Folders";
  //TODO
  //TcxFolders? folders;
  static const String activitiesXmlTag = "Activities";
  TcxActivityList? activities;
  static const String workoutsXmlTag = "Workouts";
  //TODO
  //TcxWorkoutList? workouts;
  static const String coursesXmlTag = "Courses";
  //TODO
  //TcxCourseList? courses;
  static const String authorXmlTag = "Author";
  TcxAbstractSource? author;

  TcxTrainingCenterDatabase({
    //this.folders,
    this.activities,
    //this.workouts,
    //this.courses,
    this.author,
  });

  @override
  XmlElement toXmlElement(XmlName name) {
    List<XmlAttribute> attributes = [];
    tcxAttributes.forEach((key, value) {
      attributes.add(XmlAttribute(XmlName(key), value));
    });

    List<XmlElement> children = [];
    // if(folders != null){
    //   children.add(folders!.toXmlElement(XmlName(foldersXmlTag)));
    // }
    if (activities != null) {
      children.add(activities!.toXmlElement(XmlName(activitiesXmlTag)));
    }
    // if(workouts != null){
    //   children.add(workouts!.toXmlElement(XmlName(workoutsXmlTag)));
    // }
    // if(courses != null){
    //   children.add(courses!.toXmlElement(XmlName(coursesXmlTag)));
    // }

    return XmlElement(name, attributes, children);
  }

  String toXmlString({bool pretty=false, String indent='  '}){
    XmlDocument document = XmlDocument();
    XmlDeclaration declaration = XmlDeclaration();
    declaration.version = "1.0";
    declaration.encoding = "UTF-8";
    document.children.add(declaration);
    document.children.add(toXmlElement(XmlName(rootXmlTag)));
    return document.toXmlString(pretty:pretty, indent:indent);
  }

  TcxTrainingCenterDatabase.fromXmlString(String xmlString){
    final XmlDocument document = XmlDocument.parse(xmlString);
    final tcxCenterDatabase = document.rootElement;
    if(tcxCenterDatabase.name != XmlName(rootXmlTag)){
      throw ArgumentError('Could not find XmlElement $rootXmlTag');
    }
    for(XmlElement child in tcxCenterDatabase.childElements){
      switch(child.name.local){
        case foldersXmlTag:
          break;//TODO
        case activitiesXmlTag:
          activities = TcxActivityList.fromXmlElement(child);
          break;
        case workoutsXmlTag:
          break;//TODO
        case coursesXmlTag:
          break;//TODO
        case authorXmlTag:
          author = TcxAbstractSource.fromXmlElement(child);
          break;
      }
    }
  }
}
