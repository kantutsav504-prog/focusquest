import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<SelectRealm>((event, emit) {
      emit(state.copyWith(selectedRealm: event.realm));
    });

    on<SelectArchetype>((event, emit) {
      emit(state.copyWith(selectedArchetype: event.archetype));
    });

    on<ProceedToNextScreen>((event, emit) {
      if (state.currentScreen == OnboardingScreen.realmSelection) {
        emit(state.copyWith(currentScreen: OnboardingScreen.archetypeSelection));
      } else if (state.currentScreen == OnboardingScreen.archetypeSelection) {
        emit(state.copyWith(currentScreen: OnboardingScreen.complete));
      }
    });
  }
}