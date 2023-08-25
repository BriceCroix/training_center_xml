import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'course_point_type.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxCoursePointType {
  generic,
  summit,
  valley,
  water,
  food,
  danger,
  left,
  right,
  straight,
  @annotation.XmlValue('First Aid')
  firstAid,
  @annotation.XmlValue('4th Category')
  fourthCategory,
  @annotation.XmlValue('3rd Category')
  thirdCategory,
  @annotation.XmlValue('2nd Category')
  secondCategory,
  @annotation.XmlValue('1st Category')
  firstCategory,
  @annotation.XmlValue('Hors Category')
  horsCategory,
  sprint,
}
