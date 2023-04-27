import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/login_notifier.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _notifier = StateNotifierProvider<LoginNotifier, int>((ref) => LoginNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(_notifier.notifier).increament();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(_notifier.notifier).decreament();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Text(ref.watch(_notifier).toString()),
      ),
    );
  }
}
