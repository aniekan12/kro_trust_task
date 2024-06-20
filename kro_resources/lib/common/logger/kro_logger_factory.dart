import 'dart:developer' as developer;

abstract class Logger {
  void debug(String message);
  void info(String message);
  void warn(String message);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

class ConsoleLogger implements Logger {
  final String _name;

  ConsoleLogger(this._name);

  @override
  void debug(String message) {
    developer.log(message, name: _name, level: 500);
  }

  @override
  void info(String message) {
    developer.log(message, name: _name, level: 800);
  }

  @override
  void warn(String message) {
    developer.log(message, name: _name, level: 900);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(message,
        name: _name, level: 1000, error: error, stackTrace: stackTrace);
  }
}

class LoggerFactory {
  static Logger getLogger([String name = 'AppLogger']) {
    return ConsoleLogger(name);
  }
}
