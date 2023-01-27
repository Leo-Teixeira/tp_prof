import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds_2022_tp/bloc/cubit/company_cubit_cubit.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final List<Company> company = [];

  Future<void> test() async {
    await Future.delayed(Duration(seconds: 2));
    print('attendu 2 secondes');
  }

  void didChangeDependencies() async {
    print("je suis la ");
    super.didChangeDependencies();
    await test();
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
            //final Company company = _companies[index];
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
          //final Company? company =
          //await Navigator.of(context).pushNamed('/addCompany') as Company?;
          Navigator.of(context).pushNamed('/addCompany');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
