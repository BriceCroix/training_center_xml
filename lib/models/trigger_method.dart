import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'trigger_method.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxTriggerMethod {
  manual,
  distance,
  location,
  time,
  heartRate,
}
