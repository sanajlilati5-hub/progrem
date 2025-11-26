import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupa {
  final supaAuth = Supabase.instance.client.auth;
  singUp(String email, String pass) async {
   await supaAuth.signUp(password: pass, email: email);
  }

  login(String email, String pass)async {
   await supaAuth.signInWithPassword(password: pass, email: email);
  }

  logout()async {
   await supaAuth.signOut();
  }
}
