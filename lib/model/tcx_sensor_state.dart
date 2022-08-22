abstract class TcxSensorStates{
  static const String present = "Present";
  static const String absent = "Absent";
  static const List<String> values = [present, absent];
}
/// Only TcxSensorStates values are valid.
typedef TcxSensorState = String;