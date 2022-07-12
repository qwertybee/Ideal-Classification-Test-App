// To parse this JSON data, do
//
//     final detailSkill = detailSkillFromJson(jsonString);

import 'dart:convert';

DetailSkill detailSkillFromJson(String str) => DetailSkill.fromJson(json.decode(str));

String detailSkillToJson(DetailSkill data) => json.encode(data.toJson());

class DetailSkill {
  DetailSkill({
    required this.data,
    required this.source,
  });

  List<Datum> data;
  List<Source> source;

  factory DetailSkill.fromJson(Map<String, dynamic> json) => DetailSkill(
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
    required this.idSkillElementGroup,
    required this.skillElementGroup,
    required this.idSkillElement,
    required this.skillElement,
    required this.idYear,
    required this.year,
    required this.idMajorOccupationGroup,
    required this.majorOccupationGroup,
    required this.idMinorOccupationGroup,
    required this.minorOccupationGroup,
    required this.idBroadOccupation,
    required this.broadOccupation,
    required this.lvValue,
    required this.rca,
    required this.pumsOccupation,
    required this.idPumsOccupation,
    required this.slugPumsOccupation,
  });

  IdSkillElementGroup? idSkillElementGroup;
  SkillElementGroup? skillElementGroup;
  String idSkillElement;
  String skillElement;
  int idYear;
  String year;
  IdMajorOccupationGroup? idMajorOccupationGroup;
  MajorOccupationGroup? majorOccupationGroup;
  String idMinorOccupationGroup;
  BroadOccupation? minorOccupationGroup;
  String idBroadOccupation;
  BroadOccupation? broadOccupation;
  double lvValue;
  double rca;
  PumsOccupation? pumsOccupation;
  String idPumsOccupation;
  SlugPumsOccupation? slugPumsOccupation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idSkillElementGroup: idSkillElementGroupValues.map[json["ID Skill Element Group"]],
    skillElementGroup: skillElementGroupValues.map[json["Skill Element Group"]],
    idSkillElement: json["ID Skill Element"],
    skillElement: json["Skill Element"],
    idYear: json["ID Year"],
    year: json["Year"],
    idMajorOccupationGroup: idMajorOccupationGroupValues.map[json["ID Major Occupation Group"]],
    majorOccupationGroup: majorOccupationGroupValues.map[json["Major Occupation Group"]],
    idMinorOccupationGroup: json["ID Minor Occupation Group"],
    minorOccupationGroup: broadOccupationValues.map[json["Minor Occupation Group"]],
    idBroadOccupation: json["ID Broad Occupation"],
    broadOccupation: broadOccupationValues.map[json["Broad Occupation"]],
    lvValue: json["LV Value"].toDouble(),
    rca: json["RCA"].toDouble(),
    pumsOccupation: pumsOccupationValues.map[json["PUMS Occupation"]],
    idPumsOccupation: json["ID PUMS Occupation"],
    slugPumsOccupation: slugPumsOccupationValues.map[json["Slug PUMS Occupation"]],
  );

  Map<String, dynamic> toJson() => {
    "ID Skill Element Group": idSkillElementGroupValues.reverse![idSkillElementGroup],
    "Skill Element Group": skillElementGroupValues.reverse![skillElementGroup],
    "ID Skill Element": idSkillElement,
    "Skill Element": skillElement,
    "ID Year": idYear,
    "Year": year,
    "ID Major Occupation Group": idMajorOccupationGroupValues.reverse![idMajorOccupationGroup],
    "Major Occupation Group": majorOccupationGroupValues.reverse![majorOccupationGroup],
    "ID Minor Occupation Group": idMinorOccupationGroup,
    "Minor Occupation Group": broadOccupationValues.reverse![minorOccupationGroup],
    "ID Broad Occupation": idBroadOccupation,
    "Broad Occupation": broadOccupationValues.reverse![broadOccupation],
    "LV Value": lvValue,
    "RCA": rca,
    "PUMS Occupation": pumsOccupationValues.reverse![pumsOccupation],
    "ID PUMS Occupation": idPumsOccupation,
    "Slug PUMS Occupation": slugPumsOccupationValues.reverse![slugPumsOccupation],
  };
}

enum BroadOccupation { SALES_RELATED_OCCUPATIONS }

final broadOccupationValues = EnumValues({
  "Sales & related occupations": BroadOccupation.SALES_RELATED_OCCUPATIONS
});

enum IdMajorOccupationGroup { THE_410000430000 }

final idMajorOccupationGroupValues = EnumValues({
  "410000-430000": IdMajorOccupationGroup.THE_410000430000
});

enum IdSkillElementGroup { THE_2_A_1, THE_2_A_2, THE_2_B_1, THE_2_B_2, THE_2_B_3, THE_2_B_4, THE_2_B_5 }

final idSkillElementGroupValues = EnumValues({
  "2.A.1": IdSkillElementGroup.THE_2_A_1,
  "2.A.2": IdSkillElementGroup.THE_2_A_2,
  "2.B.1": IdSkillElementGroup.THE_2_B_1,
  "2.B.2": IdSkillElementGroup.THE_2_B_2,
  "2.B.3": IdSkillElementGroup.THE_2_B_3,
  "2.B.4": IdSkillElementGroup.THE_2_B_4,
  "2.B.5": IdSkillElementGroup.THE_2_B_5
});

enum MajorOccupationGroup { SALES_OFFICE_OCCUPATIONS }

final majorOccupationGroupValues = EnumValues({
  "Sales & Office Occupations": MajorOccupationGroup.SALES_OFFICE_OCCUPATIONS
});

enum PumsOccupation { CASHIERS }

final pumsOccupationValues = EnumValues({
  "Cashiers": PumsOccupation.CASHIERS
});

enum SkillElementGroup { CONTENT, PROCESS, SOCIAL_SKILLS, COMPLEX_PROBLEM_SOLVING_SKILLS, TECHNICAL_SKILLS, SYSTEMS_SKILLS, RESOURCE_MANAGEMENT_SKILLS }

final skillElementGroupValues = EnumValues({
  "Complex Problem Solving Skills": SkillElementGroup.COMPLEX_PROBLEM_SOLVING_SKILLS,
  "Content": SkillElementGroup.CONTENT,
  "Process": SkillElementGroup.PROCESS,
  "Resource Management Skills": SkillElementGroup.RESOURCE_MANAGEMENT_SKILLS,
  "Social Skills": SkillElementGroup.SOCIAL_SKILLS,
  "Systems Skills": SkillElementGroup.SYSTEMS_SKILLS,
  "Technical Skills": SkillElementGroup.TECHNICAL_SKILLS
});

enum SlugPumsOccupation { CASHIERS }

final slugPumsOccupationValues = EnumValues({
  "cashiers": SlugPumsOccupation.CASHIERS
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
    required this.topic,
    required this.subtopic,
  });

  String sourceName;
  String sourceDescription;
  String datasetName;
  String datasetLink;
  String topic;
  String subtopic;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
    sourceName: json["source_name"],
    sourceDescription: json["source_description"],
    datasetName: json["dataset_name"],
    datasetLink: json["dataset_link"],
    topic: json["topic"],
    subtopic: json["subtopic"],
  );

  Map<String, dynamic> toJson() => {
    "source_name": sourceName,
    "source_description": sourceDescription,
    "dataset_name": datasetName,
    "dataset_link": datasetLink,
    "topic": topic,
    "subtopic": subtopic,
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
