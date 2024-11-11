import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Specificscreen extends StatefulWidget {
  const Specificscreen(
      {super.key,
      required this.name,
      required this.image,
      required this.desc,
      required this.price,
      required this.color,
      required this.stars});

  final String name;
  final String image;
  final String desc;
  final int price;
  final Color color;
  final List<bool> stars;

  @override
  State<Specificscreen> createState() => _SpecificscreenState();
}

class _SpecificscreenState extends State<Specificscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Title"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Center(
                  child: Text(
                widget.image,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
              color: widget.color,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 40),
            ),
            Text(widget.desc),
            SizedBox(
              height: 50,
            ),
            Text("Price: \$${widget.price.toString()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      // Update the state of the star at the pressed index
                      for (int i = 0; i < widget.stars.length; i++) {
                        widget.stars[i] =
                            i <= index; // Toggle stars up to the pressed index
                      }
                    });
                  },
                  icon: widget.stars[index]
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
