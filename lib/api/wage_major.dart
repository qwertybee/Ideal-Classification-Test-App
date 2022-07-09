import 'dart:convert';

WageMajor wageMajorFromJson(String str) => WageMajor.fromJson(json.decode(str));

String wageMajorToJson(WageMajor data) => json.encode(data.toJson());

class WageMajor {
  WageMajor({
    required this.data,
    required this.source,
  });

  List<Datum> data;
  List<Source> source;

  factory WageMajor.fromJson(Map<String, dynamic> json) => WageMajor(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    source: List<Source>.from(json["source"].map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "source": List<dynamic>.from(source.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.idDetailedOccupation,
    required this.detailedOccupation,
    required this.idYear,
    required this.year,
    required this.idWorkforceStatus,
    required this.workforceStatus,
    required this.averageWage,
    required this.averageWageAppxMoe,
    required this.recordCount,
    required this.slugDetailedOccupation,
  });

  String idDetailedOccupation;
  String detailedOccupation;
  int idYear;
  String year;
  bool idWorkforceStatus;
  String workforceStatus;
  double averageWage;
  double averageWageAppxMoe;
  int recordCount;
  String slugDetailedOccupation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idDetailedOccupation: json["ID Detailed Occupation"],
    detailedOccupation: json["Detailed Occupation"],
    idYear: json["ID Year"],
    year: json["Year"],
    idWorkforceStatus: json["ID Workforce Status"],
    workforceStatus: json["Workforce Status"],
    averageWage: json["Average Wage"].toDouble(),
    averageWageAppxMoe: json["Average Wage Appx MOE"].toDouble(),
    recordCount: json["Record Count"],
    slugDetailedOccupation: json["Slug Detailed Occupation"],
  );

  Map<String, dynamic> toJson() => {
    "ID Detailed Occupation": idDetailedOccupation,
    "Detailed Occupation": detailedOccupation,
    "ID Year": idYear,
    "Year": year,
    "ID Workforce Status": idWorkforceStatus,
    "Workforce Status": workforceStatus,
    "Average Wage": averageWage,
    "Average Wage Appx MOE": averageWageAppxMoe,
    "Record Count": recordCount,
    "Slug Detailed Occupation": slugDetailedOccupation,
  };
}

class Source {
  Source({
    required this.measures,
    required this.annotations,
    required this.name,
    required this.substitutions,
  });

  List<String> measures;
  Annotations annotations;
  String name;
  List<dynamic> substitutions;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    measures: List<String>.from(json["measures"].map((x) => x)),
    annotations: Annotations.fromJson(json["annotations"]),
    name: json["name"],
    substitutions: List<dynamic>.from(json["substitutions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "measures": List<dynamic>.from(measures.map((x) => x)),
    "annotations": annotations.toJson(),
    "name": name,
    "substitutions": List<dynamic>.from(substitutions.map((x) => x)),
  };
}

class Annotations {
  Annotations({
    required this.sourceName,
    required this.sourceDescription,
    required this.datasetName,
    required this.datasetLink,
    required this.subtopic,
    required this.tableId,
    required this.topic,
    required this.hiddenMeasures,
  });

  String sourceName;
  String sourceDescription;
  String datasetName;
  String datasetLink;
  String subtopic;
  String tableId;
  String topic;
  String hiddenMeasures;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
    sourceName: json["source_name"],
    sourceDescription: json["source_description"],
    datasetName: json["dataset_name"],
    datasetLink: json["dataset_link"],
    subtopic: json["subtopic"],
    tableId: json["table_id"],
    topic: json["topic"],
    hiddenMeasures: json["hidden_measures"],
  );

  Map<String, dynamic> toJson() => {
    "source_name": sourceName,
    "source_description": sourceDescription,
    "dataset_name": datasetName,
    "dataset_link": datasetLink,
    "subtopic": subtopic,
    "table_id": tableId,
    "topic": topic,
    "hidden_measures": hiddenMeasures,
  };
}


// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
//
// String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class UserModel {
//   UserModel({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.address,
//     required this.phone,
//     required this.website,
//     required this.company,
//   });
//
//   int id;
//   String name;
//   String username;
//   String email;
//   Address address;
//   String phone;
//   String website;
//   Company company;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     id: json["id"],
//     name: json["name"],
//     username: json["username"],
//     email: json["email"],
//     address: Address.fromJson(json["address"]),
//     phone: json["phone"],
//     website: json["website"],
//     company: Company.fromJson(json["company"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "username": username,
//     "email": email,
//     "address": address.toJson(),
//     "phone": phone,
//     "website": website,
//     "company": company.toJson(),
//   };
// }
//
// class Address {
//   Address({
//     required this.street,
//     required this.suite,
//     required this.city,
//     required this.zipcode,
//     required this.geo,
//   });
//
//   String street;
//   String suite;
//   String city;
//   String zipcode;
//   Geo geo;
//
//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//     street: json["street"],
//     suite: json["suite"],
//     city: json["city"],
//     zipcode: json["zipcode"],
//     geo: Geo.fromJson(json["geo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "street": street,
//     "suite": suite,
//     "city": city,
//     "zipcode": zipcode,
//     "geo": geo.toJson(),
//   };
// }
//
// class Geo {
//   Geo({
//     required this.lat,
//     required this.lng,
//   });
//
//   String lat;
//   String lng;
//
//   factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//     lat: json["lat"],
//     lng: json["lng"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lat": lat,
//     "lng": lng,
//   };
// }
//
// class Company {
//   Company({
//     required this.name,
//     required this.catchPhrase,
//     required this.bs,
//   });
//
//   String name;
//   String catchPhrase;
//   String bs;
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//     name: json["name"],
//     catchPhrase: json["catchPhrase"],
//     bs: json["bs"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "catchPhrase": catchPhrase,
//     "bs": bs,
//   };
// }
