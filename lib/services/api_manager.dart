import 'package:flutter/material.dart';
import 'package:haradan/services/Strings.dart';
import 'package:haradan/services/models/son_ilanlar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class API_Manager {
  Future<SonIlanlar> getSonIlanlar() async {
    var client = http.Client();
    var sonIlanlar;
    try {
      var response = await client.get(Uri.parse(
          'https://test.haradan.com/adverts/doping?direction=DESC&doping=MAINPAGE_SHOW_CASE&page=0&size=20&sort=createdDate'));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print('En son ilanlar' +jsonMap.toString());
        sonIlanlar = SonIlanlar.fromJson(jsonMap);
        print('en son veri' +sonIlanlar.toString());
      }
    } catch (Exception) {
      return sonIlanlar;
    }
    return sonIlanlar;
  }
}
