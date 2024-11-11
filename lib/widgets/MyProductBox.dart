import 'package:flutter/material.dart';
import 'package:mybox/screens/specificScreen.dart';

class MyProductBox extends StatefulWidget {
  const MyProductBox(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.price,
      required this.color});

  final String image;
  final String name;
  final String desc;
  final int price;
  final Color color;

  @override
  State<MyProductBox> createState() => _MyProductBoxState();
}

class _MyProductBoxState extends State<MyProductBox> {
  List<bool> pressedStates = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(141, 0, 0, 0),
            spreadRadius: 0.3,
            blurRadius: 0.5,
            offset: Offset(0, 3))
      ], color: Colors.white),
      width: 500,
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Specificscreen(
                            name: widget.name,
                            image: widget.image,
                            desc: widget.desc,
                            price: widget.price,
                            color: widget.color,
                            stars: pressedStates,
                          )));
            },
            child: Container(
              height: 200,
              width: 250,
              color: widget.color,
              child: Center(
                  child: Text(
                widget.image,
                style: TextStyle(fontSize: 30),
              )),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(widget.desc),
                Text("Price: \$${widget.price.toString()}"),
                SizedBox(height: 10),
                Row(
                  children: List.generate(3, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          // Update the state of the star at the pressed index
                          for (int i = 0; i < pressedStates.length; i++) {
                            pressedStates[i] = i <=
                                index; // Toggle stars up to the pressed index
                          }
                        });
                      },
                      icon: pressedStates[index]
                          ? Icon(Icons.star)
                          : Icon(Icons.star_border),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
