import '../../../domain/entities/users/mock_users_model.dart';

class UsersModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UsersModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        username: json['username'] as String? ?? '',
        email: json['email'] as String? ?? '',
        address: json['address'] != null
            ? Address.fromJson(json['address'])
            : Address.fromJson({}),
        phone: json['phone'] as String? ?? '',
        website: json['website'] as String? ?? '',
        company: json['company'] != null
            ? Company.fromJson(json['company'])
            : Company.fromJson({}),
      );
  MockUsersModel toDomain() => MockUsersModel(
        id: id,
        name: name,
        username: username,
        email: email,
        address: address.toDomain(),
        phone: phone,
        website: website,
        company: company.toDomain(),
      );
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String? ?? '',
        suite: json['suite'] as String? ?? '',
        city: json['city'] as String? ?? '',
        zipcode: json['zipcode'] as String? ?? '',
        geo: json['geo'] != null ? Geo.fromJson(json['geo']) : Geo.fromJson({}),
      );
  MockAddress toDomain() => MockAddress(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo.toDomain());
}

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'] as String? ?? '',
        lng: json['lng'] as String? ?? '',
      );
  MockGeo toDomain() => MockGeo(lat: lat, lng: lng);
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String? ?? '',
      catchPhrase: json['catchPhrase'] as String? ?? '',
      bs: json['bs'] as String? ?? '');
  MockCompany toDomain() =>
      MockCompany(name: name, catchPhrase: catchPhrase, bs: bs);
}
