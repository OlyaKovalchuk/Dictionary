abstract interface class ISharedPreferenceRepository {
  Future<void> init();

  Future<bool> finishIntroduction();

  bool? didTheUserFinishIntro();

  Future<bool> clear();
}
