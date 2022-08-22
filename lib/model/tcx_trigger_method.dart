abstract class TcxTriggerMethods{
  static const String manual = "Manual";
  static const String distance = "Distance";
  static const String location = "Location";
  static const String time = "Time";
  static const String heartRate = "HeartRate";
  static const List<String> values = [manual, distance, location, time, heartRate];
}
/// Only TcxTriggerMethods values are valid.
typedef TcxTriggerMethod = String;