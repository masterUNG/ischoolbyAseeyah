// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SchoolModel {
  final String school_name;
  final String logo_path;
  final String prov_name;
  final String web;
  SchoolModel({
    required this.school_name,
    required this.logo_path,
    required this.prov_name,
    required this.web,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'school_name': school_name,
      'logo_path': logo_path,
      'prov_name': prov_name,
      'web': web,
    };
  }

  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      school_name: map['school_name'] as String,
      logo_path: map['logo_path'] as String,
      prov_name: map['prov_name'] as String,
      web: map['web'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolModel.fromJson(String source) => SchoolModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
