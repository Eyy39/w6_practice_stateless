import 'package:flutter/material.dart';

// EX 4 – The weather forecast (BONUS, handout page: EX 4)
// Images are in assets/ex4/.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.lightBlueAccent.shade100,
              padding: const EdgeInsets.only(right: 10.0),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.menu, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            WeatherCard(title: "Phnom Penh", gradient: [Color(0xFFC178F6),Color(0xFF9F72F1),], image: "assets/ex4/cloudy.png", minTemp: 10.0, maxTemp: 30.0, currentTemp: 12.2),

            SizedBox(height: 20,),
            WeatherCard(title: "Paris", gradient: [Color(0xFF63E6BE),Color(0xFF66E4B4),], image: "assets/ex4/sunnyCloudy.png", minTemp: 10, maxTemp: 40, currentTemp: 22.2),

            SizedBox(height: 20),
            WeatherCard(title: "Rome", gradient: [Color.fromARGB(255, 236, 53, 163),Color.fromARGB(255, 244, 19, 120),], image: "assets/ex4/sunny.png", minTemp: 10.0, maxTemp: 40.0, currentTemp: 45.2),

            SizedBox(height: 20,),
            WeatherCard(title: "Toulouse", gradient: [Color.fromARGB(255, 243, 132, 85),Color.fromARGB(255, 234, 99, 41),], image: "assets/ex4/veryCloudy.png", minTemp: 10, maxTemp: 40, currentTemp: 45.2),
          ],
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key, required this.title, required this.gradient, required this.image, required this.minTemp, required this.maxTemp, required this.currentTemp,
  });

  final String title;
  final List<Color> gradient;
  final String image;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: gradient),
        boxShadow:[BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))] ,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Min $minTemp \u00B0C",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                Text(
                  "Max $maxTemp \u00B0C",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
          Text(
            "$currentTemp \u00B0C",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
