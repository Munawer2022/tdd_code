import 'package:test123/domain/entities/hello/mock_hello_model.dart';

class HelloModel {
  HelloModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  factory HelloModel.fromJson(Map<String, dynamic> json) {
    return HelloModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] == null
          ? Address.fromJson({})
          : Address.fromJson(json["address"]),
      phone: json["phone"] ?? "",
      website: json["website"] ?? "",
      company: json["company"] == null
          ? Company.fromJson({})
          : Company.fromJson(json["company"]),
    );
  }
  MockHelloModel toDomain() => MockHelloModel(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address.toDomain(),
      phone: phone,
      website: website,
      company: company.toDomain());
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"] ?? "",
      suite: json["suite"] ?? "",
      city: json["city"] ?? "",
      zipcode: json["zipcode"] ?? "",
      geo: json["geo"] == null ? Geo.fromJson({}) : Geo.fromJson(json["geo"]),
    );
  }
  MockAddress toDomain() => MockAddress(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo.toDomain());
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  final String lat;
  final String lng;

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json["lat"] ?? "",
      lng: json["lng"] ?? "",
    );
  }
  MockGeo toDomain() => MockGeo(lat: lat, lng: lng);
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String name;
  final String catchPhrase;
  final String bs;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["name"] ?? "",
      catchPhrase: json["catchPhrase"] ?? "",
      bs: json["bs"] ?? "",
    );
  }
  MockCompany toDomain() =>
      MockCompany(name: name, catchPhrase: catchPhrase, bs: bs);
}
