import 'package:calc_gui/components/calculate_result.dart';
import 'package:flutter/material.dart';

class BtnGrid extends StatelessWidget {
    final TextEditingController controller;
  
  const BtnGrid({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}7"}, child: Text("7")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}8"}, child: Text("8")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}9"}, child: Text("9")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}+"}, child: Text("+")),

        ElevatedButton(onPressed: () => {controller.text = "${controller.text}4"}, child: Text("4")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}5"}, child: Text("5")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}6"}, child: Text("6")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}-"}, child: Text("-")),

        ElevatedButton(onPressed: () => {controller.text = "${controller.text}1"}, child: Text("1")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}2"}, child: Text("2")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}3"}, child: Text("3")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}*"}, child: Text("*")),

        ElevatedButton(onPressed: () => {controller.text = "${controller.text}0"}, child: Text("0")),
        ElevatedButton(onPressed: () => {controller.text = ""}, child: Text("C")),
        ElevatedButton(onPressed: () => {controller.text = calculateResult(controller.text)}, child: Text("=")),
        ElevatedButton(onPressed: () => {controller.text = "${controller.text}/"}, child: Text("/")),
      ],
      );
  }
}