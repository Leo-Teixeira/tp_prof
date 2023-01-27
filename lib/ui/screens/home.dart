import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds_2022_tp/bloc/cubit/company_cubit_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<CompanyCubit>().loadCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body:
          BlocBuilder<CompanyCubit, List<Company>>(builder: (context, company) {
        return ListView.separated(
          itemCount: company.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.apartment),
              title: Text(company[index].name),
              subtitle: Text(
                  '${company[index].address.street}, ${company[index].address.postcode} ${company[index].address.city}'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 0);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).pushNamed('/addCompany');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
