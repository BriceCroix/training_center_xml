import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'sensor_state.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxSensorState {
  present,
  absent,
}
