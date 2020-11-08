// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['company_name'] as String,
    category: json['company_category'] as String,
    comment: json['comment'] as String,
    addrStreet: json['addr_street'] as String,
    addrExtra: json['addr_extra'] as String,
    addrStreetNumber: json['addr_street_number'] as String,
    addrZipCode: json['addr_zip_code'] as String,
    addrCity: json['addr_city'] as String,
    contactEmail: json['contact_email'] as String,
    contactPhone: json['contact_phone'] as String,
    contactPerson: json['contact_person'] as String,
    contactWebsite: json['contact_website'] as String,
    openingHours: json['opening_hours'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'company_name': instance.name,
      'company_category': instance.category,
      'comment': instance.comment,
      'addr_street': instance.addrStreet,
      'addr_extra': instance.addrExtra,
      'addr_street_number': instance.addrStreetNumber,
      'addr_zip_code': instance.addrZipCode,
      'addr_city': instance.addrCity,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'contact_person': instance.contactPerson,
      'contact_website': instance.contactWebsite,
      'opening_hours': instance.openingHours,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Companies _$CompaniesFromJson(Map<String, dynamic> json) {
  return Companies(
    companies: (json['companies'] as List)
        ?.map((e) =>
            e == null ? null : Company.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'companies': instance.companies,
    };
