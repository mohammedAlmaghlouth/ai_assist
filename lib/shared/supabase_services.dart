import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  late SupabaseClient client;

  SupabaseServices() {
    client = Supabase.instance.client;
  }

  Future<dynamic> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      AuthResponse response = await client.auth
          .signUp(email: email, password: password, data: {"username": username});

      // print(response);
      return response;
    } on Exception catch (e) {
      return e;
    }

  }

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // print(response.session);
      // print(response.user);
      return response;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  Future<List<String>> getUser() async {
    print(client.auth.currentUser?.email);
    return [client.auth.currentUser?.userMetadata?["username"], "${client.auth.currentUser?.email}"];
  }
}
