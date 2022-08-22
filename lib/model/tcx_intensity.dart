abstract class TcxIntensities{
  static const String active = "Active";
  static const String resting = "Resting";
  static const List<String> values = [active, resting];
}
/// Only TcxIntensities values are valid.
typedef TcxIntensity = String;