// To parse this JSON data, do
//
//     final broadEdu = broadEduFromJson(jsonString);

import 'dart:convert';

BroadEdu broadEduFromJson(String str) => BroadEdu.fromJson(json.decode(str));

String broadEduToJson(BroadEdu data) => json.encode(data.toJson());

class BroadEdu {
  BroadEdu({
    required this.data,
    required this.source,
  });

  List<Datum> data;
  List<Source> source;

  factory BroadEdu.fromJson(Map<String, dynamic> json) => BroadEdu(
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
    required this.idYear,
    required this.year,
    required this.idWorkforceStatus,
    required this.workforceStatus,
    required this.idDegree,
    required this.degree,
    required this.totalPopulation,
    required this.totalPopulationMoeAppx,
    required this.yocpopRca,
    required this.recordCount,
    required this.pumsOccupation,
    required this.idPumsOccupation,
    required this.slugPumsOccupation,
    required this.cip2,
    required this.idCip2,
  });

  int idYear;
  String year;
  bool idWorkforceStatus;
  String workforceStatus;
  int idDegree;
  Degree? degree;
  int totalPopulation;
  double totalPopulationMoeAppx;
  double yocpopRca;
  int recordCount;
  PumsOccupation? pumsOccupation;
  String idPumsOccupation;
  SlugPumsOccupation? slugPumsOccupation;
  String cip2;
  String idCip2;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idYear: json["ID Year"],
    year: json["Year"],
    idWorkforceStatus: json["ID Workforce Status"],
    workforceStatus: json["Workforce Status"],
    idDegree: json["ID Degree"],
    degree: degreeValues.map[json["Degree"]],
    totalPopulation: json["Total Population"],
    totalPopulationMoeAppx: json["Total Population MOE Appx"].toDouble(),
    yocpopRca: json["yocpop RCA"].toDouble(),
    recordCount: json["Record Count"],
    pumsOccupation: pumsOccupationValues.map[json["PUMS Occupation"]],
    idPumsOccupation: json["ID PUMS Occupation"],
    slugPumsOccupation: slugPumsOccupationValues.map[json["Slug PUMS Occupation"]],
    cip2: json["CIP2"],
    idCip2: json["ID CIP2"],
  );

  Map<String, dynamic> toJson() => {
    "ID Year": idYear,
    "Year": year,
    "ID Workforce Status": idWorkforceStatus,
    "Workforce Status": workforceStatus,
    "ID Degree": idDegree,
    "Degree": degreeValues.reverse![degree],
    "Total Population": totalPopulation,
    "Total Population MOE Appx": totalPopulationMoeAppx,
    "yocpop RCA": yocpopRca,
    "Record Count": recordCount,
    "PUMS Occupation": pumsOccupationValues.reverse![pumsOccupation],
    "ID PUMS Occupation": idPumsOccupation,
    "Slug PUMS Occupation": slugPumsOccupationValues.reverse![slugPumsOccupation],
    "CIP2": cip2,
    "ID CIP2": idCip2,
  };
}

enum Degree { BACHELORS_DEGREE }

final degreeValues = EnumValues({
  "Bachelors Degree": Degree.BACHELORS_DEGREE
});

enum PumsOccupation { MANAGEMENT_OCCUPATIONS }

final pumsOccupationValues = EnumValues({
  "Management occupations": PumsOccupation.MANAGEMENT_OCCUPATIONS
});

enum SlugPumsOccupation { MANAGEMENT_OCCUPATIONS }

final slugPumsOccupationValues = EnumValues({
  "management-occupations": SlugPumsOccupation.MANAGEMENT_OCCUPATIONS
});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
