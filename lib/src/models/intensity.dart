import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'intensity.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxIntensity {
  active,
  resting,
}
