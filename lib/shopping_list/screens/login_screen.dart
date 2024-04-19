import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:second_app/shopping_list/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var user;

  void _googleSignIn() async {
    var webClientId = dotenv.env['WEB_CLIENT_ID']!;
    var iosClientId = dotenv.env['IOS_CLIENT_ID']!;

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    setState(() {
      user = supabase.auth.currentSession;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    });
  }

  void _logOut() async {
    await supabase.auth.signOut();
    setState(() {
      user = supabase.auth.currentSession;
    });
  }

  @override
  Widget build(BuildContext context) {
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
