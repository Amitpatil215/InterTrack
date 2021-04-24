import 'package:flutter/material.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class JobApplicationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ListTile(
              title: Text('Uber Ink'),
              subtitle: Text('Product designer'),
            ),
            for (int i = 0; i < 3; i++)
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.25,
                startChild: SizedBox(
                  height: Responsive().height * 0.085,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Aug'),
                        Text(
                          '20',
                          style: TextStyle(
                            fontSize: Responsive().extraLargeW,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                endChild: SizedBox(
                  height: Responsive().height * 0.085,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: Responsive().smallW,
                        ),
                        Text(
                          'Application Submitted',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
