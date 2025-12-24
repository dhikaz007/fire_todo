part of 'services.dart';

class AppLogger {
  AppLogger._internal();
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;

  static late final Logger _logger;

  static void init({
    Level minimumLevel = Level.debug,
    int methodCount = 0,
    int errorMethodCount = 8,
    int lineLength = 110,
    bool printTime = true,
  }) {
    
    _logger = Logger(
      level: minimumLevel,
      filter: ProductionFilter(),
      output: ConsoleOutput(),
      printer: PrettyPrinter(
        printEmojis: false,
        methodCount: methodCount,
        errorMethodCount: errorMethodCount,
        lineLength: lineLength,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
    
  }

  void v(dynamic message) => _logger.t(message);
  void d(dynamic message) => _logger.d(message);
  void i(dynamic message) => _logger.i(message);
  void w(dynamic message) => _logger.w(message);
  void e(dynamic message) => _logger.e(message);

  // helper pretty json
  String prettyJson(dynamic data, {int maxChars = 3000}) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final s = encoder.convert(data);
      return s.length <= maxChars ? s : '${s.substring(0, maxChars)}…';
    } catch (_) {
      return '$data';
    }
  }

  Level levelForStatus(int status) {
    if (status >= 200 && status < 300) return Level.info;
    if (status >= 300 && status < 400) return Level.debug;
    if (status >= 400 && status < 500) return Level.warning;
    if (status >= 500) return Level.error;
    return Level.debug;
  }
}
