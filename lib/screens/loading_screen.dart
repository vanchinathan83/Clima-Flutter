import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getData() async {
    print("data");
    try {
      http.Response responseData = await http.get(
          "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02");
      print(responseData.statusCode);
      var json = convert.jsonDecode(responseData.body);
      print(json['name']);
      print(json['main']['temp']);
    } catch (e) {
      print("exception in get Data");
      print(e);
    }
  }

  void getLocation() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    getData();
    return Scaffold();
  }
}
