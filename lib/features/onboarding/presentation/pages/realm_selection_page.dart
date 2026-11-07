import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusquest/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:focusquest/features/onboarding/presentation/widgets/rpg_title.dart';
import 'package:focusquest/features/onboarding/presentation/widgets/rpg_card.dart';

class RealmSelectionPage extends StatelessWidget {
  const RealmSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final realms = [
      {'name': 'Mathematics Realm', 'desc': 'Logic, Calculus & Equations'},
      {'name': 'Computer Science Realm', 'desc': 'Algorithms, Code & Systems'},
      {'name': 'Literature & History', 'desc': 'Essays, Prose & Chronicles'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const RPGTitle(text: 'CHOOSE YOUR REALM', fontSize: 26),
              const SizedBox(height: 8),
              const Text(
                'Select your primary field of study to conquer.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: realms.length,
                      itemBuilder: (context, index) {
                        final realm = realms[index];
                        final isSelected = state.selectedRealm == realm['name'];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: RPGCard(
                            isSelected: isSelected,
                            onTap: () {
                              context.read<OnboardingBloc>().add(SelectRealm(realm['name']!));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  realm['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  realm['desc']!,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  context.read<OnboardingBloc>().add(ProceedToNextScreen());
                },
                child: const Text(
                  'ENTER REALM',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}