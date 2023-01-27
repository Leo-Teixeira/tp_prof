import 'dart:convert';

import 'package:mds_2022_tp/models/address.dart';
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
  // final String company;
  Map<String, dynamic> decode = {};
  // Address adr;
  List<Company> listCompany = [];
  final List<String>? listcompanies = prefs.getStringList('companies');
  print(listcompanies);
  if (listcompanies?.length != 0) {
    for (int i = 0; i < listcompanies!.length; i++) {
      print(jsonDecode(listcompanies[i]));
      decode = jsonDecode(listcompanies[i]);
      listCompany.add(Company.fromJson(decode));
    }
  }
  return listCompany;
}
