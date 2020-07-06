import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300],
                child: ShimmerLayout(),
              ));
        },
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 310;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: containerHeight,
            width: containerWidth,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
          Container(
            height: containerHeight,
            width: containerWidth,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
          Container(
            height: containerHeight,
            width: containerWidth * 0.75,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}