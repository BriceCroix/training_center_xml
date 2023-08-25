import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'cadence_sensor_type.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxCadenceSensorType {
  footpod,
  bike,
}
