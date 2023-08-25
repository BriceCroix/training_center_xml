import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'sport.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxSport {
  biking,
  running,
  other,
}
