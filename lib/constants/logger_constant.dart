import 'package:logger/logger.dart';

class LoggerConstant {
  static final logger = Logger(
    output: null,
    filter: null,
    printer: PrettyPrinter(
      printEmojis: true,
      colors: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      lineLength: 120,
      methodCount: 0,
      errorMethodCount: 0,
    ),
  );

  static void info(String message, {String title = "Info"}) {
    logger.i(message, error: title);
  }

  static void error(String message, {String title="Error"}) {
    logger.e(message, error: title);
  }
}
