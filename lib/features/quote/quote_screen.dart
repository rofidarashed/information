import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:information/core/cubit/app_cubit.dart';
import 'package:information/core/cubit/app_state.dart';
import 'package:information/core/widgets/shared_card.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        230,
        234,
        255,
      ), // Light yellow background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '📝 Daily Quote',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            Widget content;

            if (state is AppLoading) {
              content = const CircularProgressIndicator();
            } else if (state is QuoteSuccess) {
              content = AppCard(text: state.quote);
            } else if (state is QuoteError) {
              content = AppCard(text: state.message, isError: true);
            } else {
              content = const Text("Tap the button to get a quote ✨");
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Quote Image
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/476/476863.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  content,
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: cubit.getQuoteCubit,
                    icon: const Icon(Icons.format_quote),
                    label: const Text("New Quote"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 110, 163, 254),
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
    );
  }
}
