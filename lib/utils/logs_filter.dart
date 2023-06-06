import 'package:dictionary/utils/build_type/build_type_helper.dart';
import 'package:logger/logger.dart';

class LogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => isDevBuild;
}
