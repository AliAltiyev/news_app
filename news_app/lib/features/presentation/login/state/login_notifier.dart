import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<int> {
  LoginNotifier() : super(0);

  void increament() => state++;

  void decreament() => state--;
}
