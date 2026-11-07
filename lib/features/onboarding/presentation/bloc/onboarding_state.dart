part of 'onboarding_bloc.dart';

enum OnboardingScreen { realmSelection, archetypeSelection, complete }

class OnboardingState extends Equatable {
  final String selectedRealm;
  final String selectedArchetype;
  final OnboardingScreen currentScreen;

  const OnboardingState({
    this.selectedRealm = '',
    this.selectedArchetype = '',
    this.currentScreen = OnboardingScreen.realmSelection,
  });

  OnboardingState copyWith({
    String? selectedRealm,
    String? selectedArchetype,
    OnboardingScreen? currentScreen,
  }) {
    return OnboardingState(
      selectedRealm: selectedRealm ?? this.selectedRealm,
      selectedArchetype: selectedArchetype ?? this.selectedArchetype,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }

  @override
  List<Object?> get props => [selectedRealm, selectedArchetype, currentScreen];
}