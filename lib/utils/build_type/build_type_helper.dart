import 'package:dictionary/main.dart';
import 'package:dictionary/utils/build_type/build_type.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

BuildType get buildType => BuildTypeHelper.instance.buildType;

bool get isDevBuild => buildType == BuildType.develop;

bool get isStageBuild => buildType == BuildType.stage;

bool get isReleaseBuild => buildType == BuildType.release;

class BuildTypeHelper {
  BuildTypeHelper._();

  static final BuildTypeHelper instance = BuildTypeHelper._();

  /// Build type override
  BuildType localBuildType = BuildType.none;

  /// Current build type.
  ///
  /// First, init [BuildTypeUtils] to load build type from environment.
  BuildType buildType = BuildType.develop;

  /// Init [BuildTypeUtils] allows you to use [buildType],
  /// [isDevBuild], [isStageBuild], [isReleaseBuild].
  ///
  /// Before init, current [buildType] equal to [fallbackBuildType].
  Future<void> init() async {
    /// Load the .env file contents into dotenv
    await dotenv.load().onError((error, stackTrace) {
      logger.e('BuildTypeUtils.init: dotenv.load(), $error, $stackTrace');
    });

    buildType = _getBuildTypeFromEnvironment();
  }

  BuildType _getBuildTypeFromEnvironment() {
    if (localBuildType != BuildType.none) {
      return localBuildType;
    }

    const environment = String.fromEnvironment('Environment');
    if (environment.isNotEmpty) {
      return BuildType.getBuildType(environment);
    }

    if (dotenv.isInitialized) {
      final type = dotenv.maybeGet('BUILD_TYPE');
      if (type != null) {
        return BuildType.getBuildType(type);
      }
    }

    return BuildType.develop;
  }
}
