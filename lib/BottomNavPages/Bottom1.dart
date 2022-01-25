import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Bottom1 extends StatefulWidget {
  const Bottom1({Key? key}) : super(key: key);

  @override
  _Bottom1State createState() => _Bottom1State();
}

class _Bottom1State extends State<Bottom1> {
  var list = [
    {
      "timeDate": "07:30 am | September 5,2021",
      "task": "Clearance processing complete at MUSCAT - OMAN",
    },
    {
      "timeDate": "07:31 am | September 5,2021",
      "task": "Custom Status Updated",
    },
    {
      "timeDate": "07:32 am | September 5,2021",
      "task": "Arrived At Sort Facility  Dubai - UNITED ARAB EMIRATES",
    },
    {
      "timeDate": "07:33 am | September 5,2021",
      "task": "Departed Facility In DUBAI - UNITED ARAB EMIRATE",
    },
    {
      "timeDate": "07:34 am | September 5,2021",
      "task": "Shipment Picked Up",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.vertical,
              nodePosition: 0,
              indicatorTheme: const IndicatorThemeData(
                  size: 23,  color: Colors.pink),
              connectorTheme: const ConnectorThemeData(
                space: 30.0,
                color: Colors.pink,
                thickness: 4.0,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              contentsAlign: ContentsAlign.basic,
              connectionDirection: ConnectionDirection.before,
              connectorBuilder: (context, index, type) => SolidLineConnector(
                color: Colors.pink,
              ),
              indicatorBuilder: (context, index) => Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(2),

                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(2),
                    ),
                  ),
                ),
              ),
              itemCount: list.length,
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list[index]['timeDate'].toString()),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(list[index]['task'].toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
