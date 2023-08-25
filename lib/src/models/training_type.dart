import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'training_type.g.dart';

@annotation.XmlEnum(fieldRename: annotation.FieldRename.pascal)
enum TcxTrainingType {
  workout,
  course,
}
