// Part 1
import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void goPrevious() {
  print("Previous button clicked");
}

void goNext() {
  print("Next button clicked");
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // hides the DEBUG banner
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: goPrevious, // call the function
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: goNext, // call the function
              ),
            ),
          ],
        ),

        // Still showing first image only (Part 1)
        body: Image.asset(images[0]),
      ),
    ));


//Part 2

import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currIndex = 0;

  void showNext(){
    setState(() {
      if (currIndex < images.length - 1 ) {
        currIndex++;
      }
    });
  }

  void showPrevious(){
    setState(() {
      if (currIndex > 0 ){
        currIndex--;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: showPrevious,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: showNext,
              ),
            ),
          ],
        ),
        body: Center(
          child: Image.asset(
            images[currIndex],
            fit: BoxFit.contain,
          ),
        ),
      );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ? Answer: We use this because we need to hide the little DEBUG banner.
      home: ImageViewer(),
    ));
