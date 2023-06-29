// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'change_notifier/random_number_generator_change_notifier_stateful_widget.dart';
import 'getx/random_number_generator_get_controller_widget.dart';
import 'hook/random_number_generator_hook_widget.dart';
import 'provider/random_number_generator_change_notifier_provider_widget.dart';
import 'riverpod_state_notifier/random_number_generator_state_notifier_widget.dart';
import 'stateful/random_number_generator_stateful_widget.dart';
import 'widgets/state_navigator_button.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const RandomNumberGenerator(),
        'stateful': (context) => const RandomNumberGeneratorStatefulWidget(),
        'hooks': (context) => RandomNumberGeneratorHookWidget(),
        'change_notifier_stateful': (context) =>
            const RandomNumberGeneratorChangeNotifierStatefulWidget(),
        'change_notifier_provider': (context) =>
            const RandomNumberGeneratorChangeNotifierProviderWidget(),
        'riverpod_state_notifier': (context) =>
            RandomNumberGeneratorStateNotifierWidget(),
        'getx': (context) => RandomNumberGeneratorGetControllerWidget()
      },
      title: 'Random Number Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}

class RandomNumberGenerator extends StatelessWidget {
  const RandomNumberGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Random Number Generator'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StateNavigatorButton(
            text: 'Stateful Widget',
            navigatorText: 'stateful',
          ),
          StateNavigatorButton(
            text: 'Flutter Hooks',
            navigatorText: 'hooks',
          ),
          StateNavigatorButton(
            text: 'Change Notifier Stateful Widget',
            navigatorText: 'change_notifier_stateful',
          ),
          StateNavigatorButton(
            text: 'Change Notifier Provider',
            navigatorText: 'change_notifier_provider',
          ),
          StateNavigatorButton(
            text: 'Riverpod State Notifier',
            navigatorText: 'riverpod_state_notifier',
          ),
          StateNavigatorButton(
            text: 'Getx',
            navigatorText: 'getx',
          ),
        ],
      ),
    );
  }
}
