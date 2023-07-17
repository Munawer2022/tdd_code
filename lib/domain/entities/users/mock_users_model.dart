import 'package:equatable/equatable.dart';

class MockUsersModel extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final MockAddress address;
  final String phone;
  final String website;
  final MockCompany company;

  const MockUsersModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory MockUsersModel.empty() => MockUsersModel(
      id: 0,
      name: '',
      username: '',
      email: '',
      address: MockAddress.empty(),
      phone: '',
      website: '',
      company: MockCompany.empty());

  MockUsersModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    MockAddress? address,
    String? phone,
    String? website,
    MockCompany? company,
  }) =>
      MockUsersModel(
          id: id ?? this.id,
          name: name ?? this.name,
          username: username ?? this.username,
          email: email ?? this.email,
          address: address ?? this.address,
          phone: phone ?? this.phone,
          website: website ?? this.website,
          company: company ?? this.company);
  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}

class MockAddress extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final MockGeo geo;

  const MockAddress(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});
  factory MockAddress.empty() => MockAddress(
      street: '', suite: '', city: '', zipcode: '', geo: MockGeo.empty());
  MockAddress copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    MockGeo? geo,
  }) =>
      MockAddress(
          street: street ?? this.street,
          suite: suite ?? this.suite,
          city: city ?? this.city,
          zipcode: zipcode ?? this.zipcode,
          geo: geo ?? this.geo);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}

class MockGeo extends Equatable {
  final String lat;
  final String lng;

  const MockGeo({required this.lat, required this.lng});
  factory MockGeo.empty() => const MockGeo(lat: '', lng: '');
  MockGeo copyWith({
    String? lat,
    String? lng,
  }) =>
      MockGeo(lat: lat ?? this.lat, lng: lng ?? this.lng);
  @override
  List<Object?> get props => [lat, lng];
}

class MockCompany extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const MockCompany(
      {required this.name, required this.catchPhrase, required this.bs});
  factory MockCompany.empty() =>
      const MockCompany(name: '', catchPhrase: '', bs: '');
  MockCompany copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) =>
      MockCompany(
          name: name ?? this.name,
          catchPhrase: catchPhrase ?? this.catchPhrase,
          bs: bs ?? this.bs);
  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
