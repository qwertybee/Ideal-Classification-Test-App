// To parse this JSON data, do
//
//     final broadSkill = broadSkillFromJson(jsonString);

import 'dart:convert';

BroadSkill broadSkillFromJson(String str) => BroadSkill.fromJson(json.decode(str));

String broadSkillToJson(BroadSkill data) => json.encode(data.toJson());

class BroadSkill {
  BroadSkill({
    required this.data,
    required this.source,
  });

  List<Datum> data;
  List<Source> source;

  factory BroadSkill.fromJson(Map<String, dynamic> json) => BroadSkill(
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
  IdMinorOccupationGroup? idMinorOccupationGroup;
  MinorOccupationGroup? minorOccupationGroup;
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
    idMinorOccupationGroup: idMinorOccupationGroupValues.map[json["ID Minor Occupation Group"]],
    minorOccupationGroup: minorOccupationGroupValues.map[json["Minor Occupation Group"]],
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
    "ID Minor Occupation Group": idMinorOccupationGroupValues.reverse![idMinorOccupationGroup],
    "Minor Occupation Group": minorOccupationGroupValues.reverse![minorOccupationGroup],
    "LV Value": lvValue,
    "RCA": rca,
    "PUMS Occupation": pumsOccupationValues.reverse![pumsOccupation],
    "ID PUMS Occupation": idPumsOccupation,
    "Slug PUMS Occupation": slugPumsOccupationValues.reverse![slugPumsOccupation],
  };
}

enum IdMajorOccupationGroup { THE_110000290000 }

final idMajorOccupationGroupValues = EnumValues({
  "110000-290000": IdMajorOccupationGroup.THE_110000290000
});

enum IdMinorOccupationGroup { THE_110000130000 }

final idMinorOccupationGroupValues = EnumValues({
  "110000-130000": IdMinorOccupationGroup.THE_110000130000
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

enum MajorOccupationGroup { MANAGEMENT_BUSINESS_SCIENCE_ARTS_OCCUPATIONS }

final majorOccupationGroupValues = EnumValues({
  "Management, business, science, & arts occupations": MajorOccupationGroup.MANAGEMENT_BUSINESS_SCIENCE_ARTS_OCCUPATIONS
});

enum MinorOccupationGroup { MANAGEMENT_BUSINESS_FINANCIAL_OCCUPATIONS }

final minorOccupationGroupValues = EnumValues({
  "Management, business, & financial occupations": MinorOccupationGroup.MANAGEMENT_BUSINESS_FINANCIAL_OCCUPATIONS
});

enum PumsOccupation { MANAGEMENT_OCCUPATIONS }

final pumsOccupationValues = EnumValues({
  "Management occupations": PumsOccupation.MANAGEMENT_OCCUPATIONS
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
