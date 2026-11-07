import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusquest/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:focusquest/features/onboarding/presentation/pages/realm_selection_page.dart';
import 'package:focusquest/features/onboarding/presentation/pages/archetype_selection_page.dart';

class FocusQuestApp extends StatelessWidget {
  const FocusQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: MaterialApp(
        title: 'FocusQuest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0A0A12),
          primarySwatch: Colors.deepPurple,
        ),
        home: const OnboardingFlow(),
      ),
    );
  }
}

class OnboardingFlow extends StatelessWidget {
  const OnboardingFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.currentScreen == OnboardingScreen.complete) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🎉 Onboarding Complete! Welcome to FocusQuest!'),
              backgroundColor: Colors.deepPurple,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.currentScreen == OnboardingScreen.archetypeSelection) {
          return const ArchetypeSelectionPage();
        } else if (state.currentScreen == OnboardingScreen.complete) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'QUEST STARTED!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.purpleAccent),
                  ),
                  const SizedBox(height: 12),
                  Text('Realm: ${state.selectedRealm}', style: const TextStyle(fontSize: 16)),
                  Text('Archetype: ${state.selectedArchetype}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }
        return const RealmSelectionPage();
      },
    );
  }
}