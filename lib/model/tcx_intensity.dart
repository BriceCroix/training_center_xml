/// List of all valid values for TcxIntensity.
abstract class TcxIntensities{
  static const String active = "Active";
  static const String resting = "Resting";
  static const List<String> values = [active, resting];
}
/// Intensity of a sport session.
typedef TcxIntensity = String;