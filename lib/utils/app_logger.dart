import 'package:logger/logger.dart' as log;

class AppLogger{
  static final _logger = log.Logger(
    printer: log.PrettyPrinter(
      printEmojis: true,
      methodCount: 0,
    ),
  );
  static void print(dynamic value) {
    _logger.d(value.toString());
  }



}