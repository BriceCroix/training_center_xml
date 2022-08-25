import 'package:training_center_xml/model/tcx_serializable.dart';

abstract class TcxExtension implements TcxSerializable{
  String getExtensionName();
}