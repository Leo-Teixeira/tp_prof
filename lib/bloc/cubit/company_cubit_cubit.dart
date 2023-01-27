import 'package:bloc/bloc.dart';
import 'package:mds_2022_tp/models/company.dart';
import 'package:mds_2022_tp/repositories/preference_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'company_cubit_state.dart';

List<Company> companyadresse = [];

class CompanyCubit extends Cubit<List<Company>> {
  final SharedPreferences connect;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.connect) : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    companyadresse = await loadCompanie();
    emit(companyadresse);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    companyadresse.add(company);
    saveCompanies(companyadresse);
    emit([...state, company]);
  }
}
