import 'dart:convert';

import 'package:mds_2022_tp/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCompanies(List<Company> companies) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String> listJson = [];
  for (final Company company in companies) {
    listJson.add(jsonEncode(company.toJson()));
  }
  prefs.setStringList('companies', listJson);
}

Future<List<Company>> loadCompanie() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String company;
  final List<String>? listcompanies = prefs.getStringList('companies');
  print(listcompanies);
  if (listcompanies?.length != 0) {
    for (int i = 0; i < listcompanies!.length; i++) {
      print(listcompanies[i][3]);
      //company = listcompanies;
      //company.add();
    }
    //return company;
  }
  return [];
}
