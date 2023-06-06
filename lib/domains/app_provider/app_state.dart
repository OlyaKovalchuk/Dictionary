abstract class AppState {}

class InitState extends AppState {}

class SplashEndedState extends AppState {
  SplashEndedState({required this.didTheUserFinishIntro});

  final bool didTheUserFinishIntro;
}
