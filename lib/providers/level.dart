import 'package:flutter/material.dart';
import '../models/level_Info.dart';
import '../core/util/constants.dart';
import 'package:Quiz/pages/multiple_q_screen.dart';
import 'package:Quiz/pages/true_false_q_screen.dart';

class LevelProvider with ChangeNotifier {
  List<Type> _mylevel = [
    Type(
        title: "True or False",
        subtitle: "Type 1",
        description:
            "Do you feel exciting? Here you\'ll challenge one of our most easy  true-false questions!",
        icon: Icons.check,
        image: "assets/images/bags.png",
        colors: [kL1, kL12],
        routeName: TrueFalseQuiz.id),
    Type(
        title: "Multiple Choice",
        subtitle: "Type 2",
        colors: [kL2, kL22],
        routeName: MultiQScreen.id,
        icon: Icons.play_arrow,
        image: "assets/images/ballon-s.png",
        description:
            "Do you feel confident? Here you\'ll challenge one of our most difficult muliple choice questions!"),
  ];

  List<Type> get mylevel => _mylevel;
}
