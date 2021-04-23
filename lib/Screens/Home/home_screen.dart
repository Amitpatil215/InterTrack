import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/responsive.dart';
import 'package:intertrack/Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive().smallW),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Full Stack Designer',
                      style: TextStyle(
                        fontSize: Responsive().mediumW,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.bolt,
                              size: Responsive().largeW,
                            ),
                            SizedBox(
                              width: Responsive().smallW,
                            ),
                            Text('Researching'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.calendar,
                              size: Responsive().largeW,
                            ),
                            SizedBox(
                              width: Responsive().smallW,
                            ),
                            Text('Applied on 14th Feb'),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                        ),
                        onPressed: () {}),
                  ),
                  ListTile(
                    title: Text('Uber Technologies Inc'),
                    subtitle: Row(
                      children: [
                        Text('data'),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive().smallW,
                            vertical: Responsive().width * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: scaffoldBGColor,
                            borderRadius: BorderRadius.circular(
                              Responsive().smallW,
                            ),
                          ),
                          child: Text('FullTime'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomBottomModelSheet(context, NewJobSheet());
        },
        label: Text('New'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
