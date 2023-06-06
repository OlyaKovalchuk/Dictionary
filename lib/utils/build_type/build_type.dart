enum BuildType {
  develop,
  stage,
  release,
  none;

  static BuildType getBuildType(String type) {
    switch (type) {
      case 'develop':
        return BuildType.develop;
      case 'stage':
        return BuildType.stage;
      case 'release':
        return BuildType.release;
      default:
        return BuildType.develop;
    }
  }
}
