import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Puzzle2(),
  ));
}

class Puzzle2 extends StatefulWidget {
  const Puzzle2({super.key});

  @override
  State<Puzzle2> createState() => _Puzzle2State();
}

class _Puzzle2State extends State<Puzzle2> {

  static List num = ["1", "2", "3", "4", "5", "6", "7", "8", ""];
  bool yes = false;

  win(text) {
    if (num[0] == "1" &&
        num[1] == "2" &&
        num[2] == "3" &&
        num[3] == "4" &&
        num[4] == "5" &&
        num[5] == "6" &&
        num[6] == "7" &&
        num[7] == "8" &&
        num[8] == "") {

      showDialog(
        barrierDismissible: false,
        context: context, builder: (context) {
        return AlertDialog(
          title: Text('You Are Win'),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('ok')),
          ],
        );
      },);
      yes = true;
    }
  }

  click(text) {
    if (text == num[0]) {
      if (num[1] == "") {
        num[1] = num[0];
        num[0] = "";
      } else if (num[3] == "") {
        num[3] = num[0];
        num[0] = "";
      }
    } else if (text == num[1]) {
      if (num[0] == "") {
        num[0] = num[1];
        num[1] = "";
      } else if (num[2] == "") {
        num[2] = num[1];
        num[1] = "";
      } else if (num[4] == "") {
        num[4] = num[1];
        num[1] = "";
      }
    } else if (text == num[2]) {
      if (num[1] == "") {
        num[1] = num[2];
        num[2] = "";
      } else if (num[5] == "") {
        num[5] = num[2];
        num[2] = "";
      }
    } else if (text == num[3]) {
      if (num[0] == "") {
        num[0] = num[3];
        num[3] = "";
      } else if (num[4] == "") {
        num[4] = num[3];
        num[3] = "";
      } else if (num[6] == "") {
        num[6] = num[3];
        num[3] = "";
      }
    } else if (text == num[4]) {
      if (num[1] == "") {
        num[1] = num[4];
        num[4] = "";
      } else if (num[3] == "") {
        num[3] = num[4];
        num[4] = "";
      } else if (num[5] == "") {
        num[5] = num[4];
        num[4] = "";
      } else if (num[7] == "") {
        num[7] = num[4];
        num[4] = "";
      }
    } else if (text == num[5]) {
      if (num[2] == "") {
        num[2] = num[5];
        num[5] = "";
      } else if (num[4] == "") {
        num[4] = num[5];
        num[5] = "";
      } else if (num[8] == "") {
        num[8] = num[5];
        num[5] = "";
      }
    } else if (text == num[6]) {
      if (num[3] == "") {
        num[3] = num[6];
        num[6] = "";
      } else if (num[7] == "") {
        num[7] = num[6];
        num[6] = "";
      }
    } else if (text == num[7]) {
      if (num[6] == "") {
        num[6] = num[7];
        num[7] = "";
      } else if (num[4] == "") {
        num[4] = num[7];
        num[7] = "";
      } else if (num[8] == "") {
        num[8] = num[7];
        num[7] = "";
      }
    } else if (text == num[8]) {
      if (num[7] == "") {
        num[7] = num[8];
        num[8] = "";
      } else if (num[5] == "") {
        num[5] = num[8];
        num[8] = "";
      }
    }
  }

  Widget buildCard(String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            click(text);
            win(text);
          });
        },
        child: Card(
          color: Colors.lime,
          elevation: 20,
          shadowColor: Colors.blue,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
              "Puzzle",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbsorbPointer(
              absorbing: yes,
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          buildCard(num[0]),
                          buildCard(num[1]),
                          buildCard(num[2]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          buildCard(num[3]),
                          buildCard(num[4]),
                          buildCard(num[5]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          buildCard(num[6]),
                          buildCard(num[7]),
                          buildCard(num[8]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
              width: 500,
            ),
            InkWell(
              onTap: (){
                setState(() {
                  yes=false;
                  num.shuffle();
                });
              },
              child: Container(
                height: 50,
                width: 150,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  color: Colors.orange,
                  elevation: 10,
                  child: Center(child: Text("Reset",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}