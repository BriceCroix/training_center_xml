/// Represents valid values for TcxCadenceSensorType.
abstract class TcxCadenceSensorTypes{
  static const String footpod = "Footpod";
  static const String bike = "Bike";
  static const List<String> values = [footpod, bike];
}
/// Represents a type of cadence sensor.
typedef TcxCadenceSensorType = String;