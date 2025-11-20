//Part 1: 1. The goal of Sizebox: is to control the size of the box which it'll take(heigh/width) or space.
//        2. ElevatedButton: a material button with shadow/bg color/click action/so on for main actions


// part 2
import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
            ),
            child: Center(
              child: Text(
                isSelected ? "Selected" : "Not Selected",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              )
            ),
          )
      );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom buttons"),
      ),
      body: Center(
        child: SelectableButton(),
        ),
      ),
  )
);


//Part 3
import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {

  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
            ),
            child: Center(
              child: Text(
                isSelected ? "Selected" : "Not Selected",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              )
            ),
          )
      );
  }
}


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
          ],
        ),
      )
    ),
  )
);
