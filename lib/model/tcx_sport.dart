abstract class TcxSports{
  static const String running = "Running";
  static const String biking = "Biking";
  static const String other = "Other";
  static const List<String> values = [running, biking, other];
}
/// Only TcxSports values are valid.
typedef TcxSport = String;