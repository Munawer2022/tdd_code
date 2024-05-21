import 'package:equatable/equatable.dart';

class MockHelloModel extends Equatable {
  MockHelloModel({
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
  final MockAddress address;
  final String phone;
  final String website;
  final MockCompany company;

  factory MockHelloModel.empty() => MockHelloModel(
      id: 0,
      name: "",
      username: "",
      email: "",
      address: MockAddress.empty(),
      phone: "",
      website: "",
      company: MockCompany.empty());
  MockHelloModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    MockAddress? address,
    String? phone,
    String? website,
    MockCompany? company,
  }) {
    return MockHelloModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        address,
        phone,
        website,
        company,
      ];
}

class MockAddress extends Equatable {
  MockAddress({
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
  final MockGeo geo;
  factory MockAddress.empty() => MockAddress(
      street: "", suite: "", city: "", zipcode: "", geo: MockGeo.empty());
  MockAddress copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    MockGeo? geo,
  }) {
    return MockAddress(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  @override
  List<Object?> get props => [
        street,
        suite,
        city,
        zipcode,
        geo,
      ];
}

class MockGeo extends Equatable {
  MockGeo({
    required this.lat,
    required this.lng,
  });

  final String lat;
  final String lng;
  factory MockGeo.empty() => MockGeo(lat: "", lng: "");
  MockGeo copyWith({
    String? lat,
    String? lng,
  }) {
    return MockGeo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}

class MockCompany extends Equatable {
  MockCompany({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String name;
  final String catchPhrase;
  final String bs;

  factory MockCompany.empty() => MockCompany(name: "", catchPhrase: "", bs: "");

  MockCompany copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return MockCompany(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  List<Object?> get props => [
        name,
        catchPhrase,
        bs,
      ];
}
