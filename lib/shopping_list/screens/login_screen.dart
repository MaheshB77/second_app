import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:second_app/shopping_list/providers/auth_provider.dart';

final supabase = Supabase.instance.client;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var user;

  void _googleSignIn() async {
    await ref.read(authProvider.notifier).signInWithGoogle();
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
      ),
    );
  }

  void _logOut() async {
    ref.read(authProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context) {
    user = ref.watch(authProvider);
    Widget button = user == null
        ? ElevatedButton(
            onPressed: _googleSignIn,
            child: const Text('Sign in with google'),
          )
        : ElevatedButton(
            onPressed: _logOut,
            child: const Text('Log out !'),
          );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [button],
        ),
      ),
    );
  }
}
