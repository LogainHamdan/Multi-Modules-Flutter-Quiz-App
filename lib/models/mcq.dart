// To parse this JSON data, do
//
//     final mcq = mcqFromJson(jsonString);

import 'dart:convert';

import 'package:Quiz/models/question.dart';

import '../modules/true_false/question.dart';

Mcq mcqFromJson(String str) => Mcq.fromJson(json.decode(str));

String mcqToJson(Mcq data) => json.encode(data.toJson());

class Mcq {
  int id;
  dynamic name;
  String title;
  String description;
  dynamic difficultyLevel;
  String topic;
  DateTime time;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  int duration;
  DateTime endTime;
  String negativeMarks;
  String correctAnswerMarks;
  bool shuffle;
  bool showAnswers;
  bool lockSolutions;
  bool isForm;
  bool showMasteryOption;
  dynamic readingMaterial;
  dynamic quizType;
  bool isCustom;
  dynamic bannerId;
  dynamic examId;
  bool showUnanswered;
  DateTime endsAt;
  dynamic lives;
  String liveCount;
  int coinCount;
  int questionsCount;
  String dailyDate;
  int maxMistakeCount;
  List<dynamic> readingMaterials;
  List<Question> questions;
  int progress;

  Mcq({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.time,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
    required this.endTime,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.shuffle,
    required this.showAnswers,
    required this.lockSolutions,
    required this.isForm,
    required this.showMasteryOption,
    required this.readingMaterial,
    required this.quizType,
    required this.isCustom,
    required this.bannerId,
    required this.examId,
    required this.showUnanswered,
    required this.endsAt,
    required this.lives,
    required this.liveCount,
    required this.coinCount,
    required this.questionsCount,
    required this.dailyDate,
    required this.maxMistakeCount,
    required this.readingMaterials,
    required this.questions,
    required this.progress,
  });

  factory Mcq.fromJson(Map<String, dynamic> json) => Mcq(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        time: DateTime.parse(json["time"]),
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        duration: json["duration"],
        endTime: DateTime.parse(json["end_time"]),
        negativeMarks: json["negative_marks"],
        correctAnswerMarks: json["correct_answer_marks"],
        shuffle: json["shuffle"],
        showAnswers: json["show_answers"],
        lockSolutions: json["lock_solutions"],
        isForm: json["is_form"],
        showMasteryOption: json["show_mastery_option"],
        readingMaterial: json["reading_material"],
        quizType: json["quiz_type"],
        isCustom: json["is_custom"],
        bannerId: json["banner_id"],
        examId: json["exam_id"],
        showUnanswered: json["show_unanswered"],
        endsAt: DateTime.parse(json["ends_at"]),
        lives: json["lives"],
        liveCount: json["live_count"],
        coinCount: json["coin_count"],
        questionsCount: json["questions_count"],
        dailyDate: json["daily_date"],
        maxMistakeCount: json["max_mistake_count"],
        readingMaterials:
            List<dynamic>.from(json["reading_materials"].map((x) => x)),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "time": time.toIso8601String(),
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "duration": duration,
        "end_time": endTime.toIso8601String(),
        "negative_marks": negativeMarks,
        "correct_answer_marks": correctAnswerMarks,
        "shuffle": shuffle,
        "show_answers": showAnswers,
        "lock_solutions": lockSolutions,
        "is_form": isForm,
        "show_mastery_option": showMasteryOption,
        "reading_material": readingMaterial,
        "quiz_type": quizType,
        "is_custom": isCustom,
        "banner_id": bannerId,
        "exam_id": examId,
        "show_unanswered": showUnanswered,
        "ends_at":
            "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "lives": lives,
        "live_count": liveCount,
        "coin_count": coinCount,
        "questions_count": questionsCount,
        "daily_date": dailyDate,
        "max_mistake_count": maxMistakeCount,
        "reading_materials": List<dynamic>.from(readingMaterials.map((x) => x)),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "progress": progress,
      };
}

class ReadingMaterial {
  int id;
  String keywords;
  dynamic content;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> contentSections;
  PracticeMaterial practiceMaterial;

  ReadingMaterial({
    required this.id,
    required this.keywords,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.contentSections,
    required this.practiceMaterial,
  });

  factory ReadingMaterial.fromJson(Map<String, dynamic> json) =>
      ReadingMaterial(
        id: json["id"],
        keywords: json["keywords"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        contentSections:
            List<String>.from(json["content_sections"].map((x) => x)),
        practiceMaterial: PracticeMaterial.fromJson(json["practice_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "keywords": keywords,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "content_sections": List<dynamic>.from(contentSections.map((x) => x)),
        "practice_material": practiceMaterial.toJson(),
      };
}

class PracticeMaterial {
  List<String> content;
  List<String> keywords;

  PracticeMaterial({
    required this.content,
    required this.keywords,
  });

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) =>
      PracticeMaterial(
        content: List<String>.from(json["content"].map((x) => x)),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x)),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

enum Topic { MOLECULAR_BASIS_OF_INHERITANCE }

final topicValues = EnumValues(
    {"Molecular Basis Of Inheritance ": Topic.MOLECULAR_BASIS_OF_INHERITANCE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
