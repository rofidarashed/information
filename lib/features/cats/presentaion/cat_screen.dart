// feature/catfact/view/cat_fact_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:information/core/cubit/app_cubit.dart';
import 'package:information/core/cubit/app_state.dart';
import 'package:information/core/widgets/shared_card.dart';

class CatFactScreen extends StatelessWidget {
  const CatFactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 248, 229), // Soft green
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("🐱 Cat Fact"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              Widget content;

              if (state is AppLoading) {
                content = const CircularProgressIndicator();
              } else if (state is CatSuccess) {
                content = AppCard(text: state.cat);
              } else if (state is CatError) {
                content = AppCard(text: state.message, isError: true);
              } else {
                content = const Text("Tap the button to get a cat fact 🐾");
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cute Cat Icon
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/512/616/616430.png",
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    content,
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () => context.read<AppCubit>().loadFact(),
                      icon: const Icon(Icons.pets),
                      label: const Text("New Cat Fact"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
