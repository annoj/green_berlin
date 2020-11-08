import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'companies.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: 'company_name')
  final String name;

  @JsonKey(name: 'company_category')
  final String category;

  final String comment;

  @JsonKey(name: 'addr_street')
  final String addrStreet;

  @JsonKey(name: 'addr_extra')
  final String addrExtra;

  @JsonKey(name: 'addr_street_number')
  final String addrStreetNumber;

  @JsonKey(name: 'addr_zip_code')
  final String addrZipCode;

  @JsonKey(name: 'addr_city')
  final String addrCity;

  @JsonKey(name: 'contact_email')
  final String contactEmail;

  @JsonKey(name: 'contact_phone')
  final String contactPhone;

  @JsonKey(name: 'contact_person')
  final String contactPerson;

  @JsonKey(name: 'contact_website')
  final String contactWebsite;

  @JsonKey(name: 'opening_hours')
  final String openingHours;

  final double latitude;

  final double longitude;

  Company({
      @JsonKey(name: 'company_name')
      this.name,
      this.category,
      this.comment,
      this.addrStreet,
      this.addrExtra,
      this.addrStreetNumber,
      this.addrZipCode,
      this.addrCity,
      this.contactEmail,
      this.contactPhone,
      this.contactPerson,
      this.contactWebsite,
      this.openingHours,
      this.latitude,
      this.longitude});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Companies {
  final List<Company> companies;

  Companies({this.companies});

  factory Companies.fromJson(Map<String, dynamic> json) => _$CompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}

Future<Companies> getCompanies() async {
  const companiesURL = 'https://wa5p.xyz/api/companies/all';

  // Retrieve the locations of companies
  final response = await http.get(companiesURL);
  if (response.statusCode == 200) {
    var companies = Companies.fromJson(json.decode(response.body));
    print(companies);
    // return Companies.fromJson(json.decode(response.body));
    // return companies;
    return null;
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(companiesURL));
  }
}
