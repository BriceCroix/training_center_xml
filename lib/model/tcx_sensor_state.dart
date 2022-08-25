/// Represents all the valid values for TcxSensorState
abstract class TcxSensorStates{
  static const String present = "Present";
  static const String absent = "Absent";
  static const List<String> values = [present, absent];
}

/// Represents the state of a sensor during a sport session.
typedef TcxSensorState = String;