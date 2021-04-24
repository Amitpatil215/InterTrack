import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class JobApplicationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBGColor,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                size: Responsive().extraLargeW,
              ),
              onPressed: () {},
            ),
            PopupMenuButton(
              iconSize: Responsive().extraLargeW,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text('Delete'),
                ),
              ],
              onSelected: (index) {
                print(index);
              },
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: scaffoldBGColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Uber Ink',
                  style: TextStyle(
                    fontSize: Responsive().extraLargeW,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text('Product designer'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive().smallW,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive().smallW,
                    ),
                  ),
                  child: Column(
                    children: [
                      MoreDetailsInfoCardListTile(
                        icondata: CupertinoIcons.calendar,
                        title: 'Application submitted on',
                        subTitle: 'Tuesday, 27 April 2021',
                      ),
                      MoreDetailsInfoCardListTile(
                        icondata: FontAwesomeIcons.checkCircle,
                        title: 'Application Status',
                        subTitle: 'Researching',
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.25,
                  //isFirst: index == 0 ? true : false,
                  isLast: index == 4 ? true : false,
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
                          SizedBox(
                            width: Responsive().width * 0.65,
                            child: Text(
                              'Application Submitted',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreDetailsInfoCardListTile extends StatelessWidget {
  const MoreDetailsInfoCardListTile({
    this.title = '',
    this.subTitle = '',
    this.icondata,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final IconData? icondata;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minLeadingWidth: Responsive().smallW,
      leading: FaIcon(icondata),
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: Responsive().largeW,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
