import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intertrack/Utils/utils.dart';

class JobApplicationsList extends StatelessWidget {
  const JobApplicationsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Responsive().mediumW,
            ),
          ),
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
                title: Text(
                  'Uber Technologies Inc',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                subtitle: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.hourglassStart,
                      size: Responsive().width * 0.03,
                    ),
                    SizedBox(width: Responsive().smallW),
                    Text('4'),
                    SizedBox(width: Responsive().smallW),
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
                      child: Text(
                        'FullTime',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
