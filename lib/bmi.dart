import 'package:flutter/material.dart';

class BMICal extends StatefulWidget {
  const BMICal({super.key});

  @override
  State<BMICal> createState() => _BMICalState();
}

class _BMICalState extends State<BMICal> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              const SizedBox(
                height: 11,
              ),
              const Text(
                'BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                    label: Text("Enter your weight"),
                    prefixIcon: Icon(Icons.line_weight)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11,
              ),
              TextField(
                controller: htController,
                decoration: const InputDecoration(
                    label: Text("Enter your height(in CM)"),
                    prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ht = htController.text.toString();
                    if (wt != "" && ht != "") {
                      var iWt = int.parse(wt);
                      var iHt = int.parse(ht);
                      var mHt = iHt / 100;
                      var bmi = iWt / (mHt + mHt);
                      setState(() {
                        result = "Your BMI is ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all required!!";
                      });
                    }
                  },
                  child: const Text('Calculator')),
              const SizedBox(
                height: 11,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
