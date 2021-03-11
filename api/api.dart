import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static Future<LoginUser> signIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = 'http://example.com.br:4000/login';
    var header = {"Content-Type": "application/json"};
    Map params = {"email": email, "senha": password};
    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);

    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);
      final loginUser = LoginUser.fromJson(jsonResponse);
      sharedPreferences.setString("token", jsonResponse['token']);
      sharedPreferences.setInt("id", jsonResponse['id']);
      return loginUser;
    } else {
      debugPrint('Response status: ${response.statusCode}');
      return null;
    }
  }

  static Future<User> save(String name, String city, String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    int id = sharedPreferences.getInt("id");
    var url = 'http://example.com.br:4000/usuarios/' + "$id";
    var header = {
      "Content-Type": "application/json",
      "x-access-token": "$token"
    };
    Map params = {"nome": name, "cidade": city, "celular": phone};
    var _body = json.encode(params);

    var response = await http.patch(url, headers: header, body: _body);

    if (response.statusCode == 201) {
      debugPrint(response.body);
      var jsonResponse = json.decode(response.body);
      final user = User.fromJson(jsonResponse[0]);
      return user;
    } else {
      debugPrint('Response status: ${response.statusCode}');
      debugPrint(response.body);
      return null;
    }
  }

  static Future<User> searchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    int id = sharedPreferences.getInt("id");
    var url = 'http://example.com.br:4000/usuarios/' + "$id";
    var header = {
      "Content-Type": "application/json",
      "x-access-token": "$token"
    };

    var response = await http.get(url, headers: header);

    if (response.statusCode == 201) {
      debugPrint(response.body);
      var jsonResponse = json.decode(response.body);
      final user = User.fromJson(jsonResponse[0]);
      return user;
    } else {
      debugPrint('Response status: ${response.statusCode}');
      return null;
    }
  }

  static Future<bool> createUser(
      String name, String email, String password, String phoneNumber) async {
    var url = 'http://example.com.br:4000/usuarios/';
    var header = {"Content-Type": "application/json"};
    Map params = {
      "nome": name,
      "email": email,
      "senha": password,
      "celular": phoneNumber
    };
    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
