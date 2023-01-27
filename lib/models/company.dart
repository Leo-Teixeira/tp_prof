import 'package:mds_2022_tp/models/address.dart';
import 'package:mds_2022_tp/repositories/address_repository.dart';

class Company {
  final int id;
  final String name;
  final Address address;

  const Company(this.id, this.name, this.address);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address':
          Address(address.street, address.city, address.postcode).toJson(),
    };
  } 

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(json['id'], json['name'], Address.fromJson(json['address']));
  }
}
