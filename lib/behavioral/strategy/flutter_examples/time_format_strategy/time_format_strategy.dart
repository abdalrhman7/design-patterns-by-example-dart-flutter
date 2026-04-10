import 'package:intl/intl.dart';

/// 🔹 Strategy Interface
/// Defines a common interface for all formatting strategies.
/// This allows the `FormattedTime` widget to use different strategies interchangeably.
abstract class TimeFormatStrategy {
  /// Accepts a DateTime and returns a formatted string.
  String format(DateTime time);
}

/// 🔹 Concrete Strategy 1: 12-hour format (e.g., 03:15 PM)
/// Implements the algorithm to format time in 12-hour format.
class TwelveHourFormat implements TimeFormatStrategy {
  @override
  String format(DateTime time) {
    // Using intl package for consistent formatting
    return DateFormat('hh:mm a').format(time);
  }
}

/// 🔹 Concrete Strategy 2: 24-hour format (e.g., 15:15)
/// Encapsulates logic for 24-hour formatting.
class TwentyFourHourFormat implements TimeFormatStrategy {
  @override
  String format(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }
}
