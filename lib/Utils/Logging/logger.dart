import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
// Customize the log levels based on your needs
    level: Level.debug,
  );
// Logger
  static void debug(String message) {
    _logger.d(message);

    void info(String message) {
      _logger.i(message);
    }

    void warning(String message) {
      _logger.w(message);
    }

    void error(String message, [dynamic error]) {
      _logger.e(message, error: error, stackTrace: StackTrace.current);
    }
  }
}
