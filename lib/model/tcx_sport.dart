/// Represents all valid values for TcxSport.
abstract class TcxSports{
  static const String running = "Running";
  static const String biking = "Biking";
  static const String other = "Other";
  static const List<String> values = [running, biking, other];
}
/// Represents a sport type.
typedef TcxSport = String;