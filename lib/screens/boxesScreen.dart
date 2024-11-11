import 'package:flutter/material.dart';
import 'package:mybox/widgets/MyAnimatedWidget.dart';
import 'package:mybox/widgets/MyProductBox.dart';

class BoxScreen extends StatelessWidget {
  final Animation<double> animation;
  const BoxScreen({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                "Phones for Sale!",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              FadeTransition(
                opacity: animation,
                child: const MyProductBox(
                  image: 'Iphone',
                  name: 'Iphone',
                  desc: 'An expensive phone',
                  price: 9999,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyAnimatedWidget(
                animation: animation,
                child: const MyProductBox(
                  image: 'Samsung',
                  name: 'Samsung',
                  desc: 'A relatively cheap phone',
                  price: 2100,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const MyProductBox(
                image: 'Nokia',
                name: 'Nokia',
                desc: 'The indestructable phone',
                price: 21,
                color: Color(0xFF61CB65),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
