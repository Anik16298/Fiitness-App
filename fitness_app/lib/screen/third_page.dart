import 'dart:async';
import 'package:fitness_app/model/exercises_model.dart';
import 'package:fitness_app/screen/home_page.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, this.second, this.exercisesModel}) : super(key: key);

  ExercisesModel? exercisesModel;
  int? second;
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int startTime = 0;
  showDia() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Row(
              children: [
                Text(
                  'Your Task Has Been Completed...👍',
                  style: TextStyle(fontSize: 15),
                ),
                // const Icon(
                //   Icons.done,
                //   color: Colors.blue,
                // ),
              ],
            ),
            actions: [
              MaterialButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Go To Homepage',
                    style: TextStyle(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    print("our time is${widget.second}");
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick - 1 == widget.second) {
        print("Done");
        timer.cancel();
        showDia();
        setState(() {});
      } else {
        setState(() {
          startTime = timer.tick;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network("${widget.exercisesModel!.gif}"),
            Text("$startTime",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
