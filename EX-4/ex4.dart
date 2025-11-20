import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ScoreBar()
    ),
  );
}

class ScoreBar extends StatelessWidget {
  const ScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("My Scores"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ScoreCard(title: "My score in Flutter"),
            SizedBox(height: 20),
            ScoreCard(title: "My score in Dart", initialScore: 5),
            SizedBox(height: 20),
            ScoreCard(title: "My score in React", initialScore: 10),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;

  const ScoreCard({super.key, required this.title, this.initialScore = 8});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  Color getProgressColor() {
    if (widget.title.contains("Flutter")) return Colors.blueAccent;
    if (widget.title.contains("Dart")) return Colors.lightBlueAccent;
    return Colors.lightBlue;
  }

  @override
  Widget build(BuildContext context) {
    double progress = score / 10;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.lightBlue, width: 3),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 15),

          // Buttons with score
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.grey),
                onPressed: score > 0 ? () => setState(() => score--) : null,
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  '$score',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.grey),
                onPressed: score < 10 ? () => setState(() => score++) : null,
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Progress bar
          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: getProgressColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}