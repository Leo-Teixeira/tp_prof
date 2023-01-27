import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds_2022_tp/bloc/cubit/company_cubit_cubit.dart';
import 'package:mds_2022_tp/ui/screens/add_company.dart';
import 'package:mds_2022_tp/ui/screens/home.dart';
import 'package:mds_2022_tp/ui/screens/search_address.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences connect = await SharedPreferences.getInstance();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit(connect);
  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => Home(),
        '/addCompany': (context) => AddCompany(),
        '/searchAddress': (context) => const SearchAddress()
      },
      initialRoute: '/home',
    );
  }
}
