import 'package:calc_gui/components/btn_grid.dart';
import 'package:calc_gui/components/display_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _myController = TextEditingController();
  
  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Container(
            height: 700,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 10.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.black
                      ),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DisplayField(controller: _myController),
                    ),
                  ),
                  Expanded(child: BtnGrid(controller : _myController))
                ],
              ),
            ),
          ),
        )
      );
  }
}