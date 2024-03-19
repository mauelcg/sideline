import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../app/app.logger.dart';
import '../constants/app_keys.dart';

class EnvironmentService {
  final logger = getLogger('EnvironmentService');

  Future initialise() async {
    logger.i('Load environment');
    await dotenv.load(fileName: 'env');
    logger.v('Environment loaded');
  }

  // Returns the value associated with the key
  String getValue(String key, {bool verbose = false}) {
    final value = dotenv.env[key] ?? NoKey;
    if (verbose) {
      logger.v('key:$key value:$value');
    }
    return value;
  }
}
