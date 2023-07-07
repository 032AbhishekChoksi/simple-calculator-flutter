import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtNum1 = TextEditingController();
  TextEditingController txtNum2 = TextEditingController();

  clear() {
    txtNum1.clear();
    txtNum2.clear();
  }

  int? result = 0, num1 = 0, num2 = 0;

  add() {
    setState(() {
      num1 = int.parse(txtNum1.text);
      num2 = int.parse(txtNum2.text);
      result = num1! + num2!;
    });
  }

  sub() {
    setState(() {
      num1 = int.parse(txtNum1.text);
      num2 = int.parse(txtNum2.text);
      result = num1! - num2!;
    });
  }

  mul() {
    setState(() {
      num1 = int.parse(txtNum1.text);
      num2 = int.parse(txtNum2.text);
      result = num1! * num2!;
    });
  }

  div(){
    setState(() {
      num1 = int.parse(txtNum1.text);
      num2 = int.parse(txtNum2.text);
      result = num1! ~/ num2!.round();
    });
  }

  // bool isFilled(){
  //   bool filled = true;
  //   if(txtNum1.text !="" || txtNum2.text != ""){
  //     filled = false;
  //   }
  //   return filled;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Result: $result",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: txtNum1,
              decoration: InputDecoration(
                  labelText: 'Enter First Number',
                  hintText: 'Enter Num 1',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((20)))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: txtNum2,
              decoration: InputDecoration(
                  labelText: 'Enter Second Number',
                  hintText: 'Enter Num 2',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((20)))),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      add();
                      clear();
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    )),
                ElevatedButton(
                    onPressed: () {
                      sub();
                      clear();
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 40),
                    )),
                ElevatedButton(
                    onPressed: () {
                      mul();
                      clear();
                    },
                    child: const Text(
                      '*',
                      style: TextStyle(fontSize: 40),
                    )),
                ElevatedButton(
                    onPressed: () {
                      div();
                      clear();
                    },
                    child: const Text(
                      '/',
                      style: TextStyle(fontSize: 40),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
