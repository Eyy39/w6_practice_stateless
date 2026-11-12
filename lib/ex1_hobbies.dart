import 'package:flutter/material.dart';

// EX 1 – The hobbies (handout page: EX 1)
// Part 1: build ONE hobby card.
// Part 2: extract it into a StatelessWidget called HobbyCard, then show several cards.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  "My Hobbies",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(40),
                  color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HobbyCard(icon: Icons.travel_explore, title: "Travelling",color: Colors.green,),
                      SizedBox(
                        height: 10,
                      ),
                      HobbyCard(icon: Icons.skateboarding,title: "Skating", color: Colors.blueGrey,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ), // YOUR CODE
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue
  });

  @override
  Widget build(BuildContext context,) {
    return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ));
  }
}

