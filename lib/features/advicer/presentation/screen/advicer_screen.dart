// feature/advicer/view/advice_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:information/core/cubit/app_cubit.dart';
import 'package:information/core/cubit/app_state.dart';
import 'package:information/core/widgets/shared_card.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 254, 229), // Soft green
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("💡 Daily Advice"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              Widget content;

              if (state is AppLoading) {
                content = const CircularProgressIndicator();
              } else if (state is AdviceSuccess) {
                content = AppCard(text: state.advice);
              } else if (state is AdviceError) {
                content = AppCard(text: state.message, isError: true);
              } else {
                content = const Text("Tap the button to get advice 🧠");
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lightbulb image
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/512/6713/6713995.png",
                      height: 100,
                    ),

                    const SizedBox(height: 20),
                    content,

                    const SizedBox(height: 30),

                    ElevatedButton.icon(
                      onPressed: () =>
                          context.read<AppCubit>().getAdviceCubit(),
                      icon: const Icon(Icons.refresh),
                      label: const Text("New Advice"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
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
