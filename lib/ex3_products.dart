import 'package:flutter/material.dart';

// EX 3 – The products (handout page: EX 3)
// Part 1: build ONE product card (images are in assets/ex3/).
// Part 2: create the Product enum (follow the UML in the handout).
// Part 3: extract the card into a StatelessWidget called ProductCard.
enum Products {
  dart(title: "Dart", description: "the best object language", image: "assets/ex3/dart.png"),
  flutter(title: "Flutter", description: "the best mobile widget library", image: "assets/ex3/flutter.png"),
  firebase(title: "Firebase", description: "the best cloud database", image: "assets/ex3/firebase.png");

  final String title;
  final String description;
  final String image;

  const Products({required this.title, required this.description, required this.image});
}
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Products"),
                padding: EdgeInsets.all(10),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Column(
                    children: [
                      ProductCard(products: Products.dart,),

                      SizedBox(height: 10,),
                      ProductCard(products: Products.flutter,),

                      SizedBox(height: 10,),
                      ProductCard(products: Products.firebase,),
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.products,
  });
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,             
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(products.image, width: 100, height: 100,),
            Text(products.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight(600)),),
            Text(products.description),
          ],
        ),
      ),
    );
  }
}
