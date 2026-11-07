part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {}

class SelectRealm extends OnboardingEvent {
  final String realm;
  SelectRealm(this.realm);
}

class SelectArchetype extends OnboardingEvent {
  final String archetype;
  SelectArchetype(this.archetype);
}

class ProceedToNextScreen extends OnboardingEvent {}