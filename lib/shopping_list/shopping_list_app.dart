import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/screens/login_screen.dart';

class ShoppingListApp extends ConsumerWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const LoginScreen();
  }
}