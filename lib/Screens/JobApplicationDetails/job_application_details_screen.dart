import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
import 'package:intertrack/Model/JobApplication.dart';
import 'package:intertrack/Screens/Home/NewApplicationSheetWidgets/new_job_application_widget.dart';
import 'package:intertrack/Shared/Shared.dart';
import 'package:intertrack/Utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class JobApplicationDetailsScreen extends StatelessWidget {
  final JobApplicationsController? _jobApplicationsController =
      Get.put(JobApplicationsController());
  final NewJobApplicationController? _newJobApplicationController =
      Get.put(NewJobApplicationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        JobApplication _jobApplication =
            _jobApplicationsController!.jobApplications.firstWhere((element) =>
                element.id ==
                _jobApplicationsController!.selectedJobApplicationId.value);
        return Scaffold(
          backgroundColor: scaffoldBGColor,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: Responsive().extraLargeW,
                ),
                onPressed: () {
                  showCustomBottomModelSheet(context, NewJobSheet()).then((_) {
                    _newJobApplicationController?.resetAllFieldsInSheet();
                  });
                },
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
                    _jobApplication.companyName,
                    style: TextStyle(
                      fontSize: Responsive().extraLargeW,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(_jobApplication.position),
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
                          subTitle: formatDate(
                              _jobApplication.dateOfApplication ??
                                  DateTime.now()),
                        ),
                        MoreDetailsInfoCardListTile(
                          icondata: FontAwesomeIcons.checkCircle,
                          title: 'Application Status',
                          subTitle: describeEnum(_jobApplication.statusLabel),
                        )
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _jobApplication.stages.length,
                  itemBuilder: (context, index) => TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.25,
                    isLast: index == _jobApplication.stages.length - 1
                        ? true
                        : false,
                    startChild: SizedBox(
                      height: Responsive().height * 0.085,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              formatDateMMM(
                                _jobApplication.stages[index].scheduledOn ??
                                    DateTime.now(),
                              ),
                            ),
                            Text(
                              formatDateDD(
                                _jobApplication.stages[index].scheduledOn ??
                                    DateTime.now(),
                              ),
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
                                _jobApplication.stages[index].title,
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
        );
      }),
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
