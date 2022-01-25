import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Bottom2 extends StatefulWidget {
  const Bottom2({Key? key}) : super(key: key);

  @override
  _Bottom2State createState() => _Bottom2State();
}

class _Bottom2State extends State<Bottom2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(

                    child: Column(
                      children: [
                        Image.asset("assets/Images/album1.jpg"),
                        Text(itemIndex.toString())
                      ],
                    ),
                ),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 1.0,
              initialPage: 2,
            ),
          ),
        ),

    );
  }
}
