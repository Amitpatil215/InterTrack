import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Controller/new_job_application_controller.dart';
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
    final _selectedApplicationId =
        _jobApplicationsController?.selectedJobApplicationId;
    return Obx(() {
      final int? _index = _jobApplicationsController!
          .getIndexOfJobApplicationFromListById(
              _selectedApplicationId?.value ?? '');
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
                  if (index == 0) {
                    Navigator.of(context).pop();
                    _jobApplicationsController?.deleteJobApplicationById(
                        _selectedApplicationId?.value ?? '');
                  }
                },
              ),
            ],
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: scaffoldBGColor,
            elevation: 0,
          ),
          body: _index != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: Obx(() {
                          return Text(
                            _jobApplicationsController
                                    ?.jobApplications[_index].companyName ??
                                '',
                            style: TextStyle(
                              fontSize: Responsive().extraLargeW,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                        subtitle: Obx(() {
                          return Text(_jobApplicationsController
                                  ?.jobApplications[_index].position ??
                              '');
                        }),
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
                              Obx(() {
                                return MoreDetailsInfoCardListTile(
                                  icondata: CupertinoIcons.calendar,
                                  title: 'Application submitted on',
                                  subTitle: formatDate(
                                      _jobApplicationsController
                                              ?.jobApplications[_index]
                                              .dateOfApplication ??
                                          DateTime.now()),
                                );
                              }),
                              Obx(() {
                                return MoreDetailsInfoCardListTile(
                                  icondata: FontAwesomeIcons.checkCircle,
                                  title: 'Application Status',
                                  subTitle: describeEnum(
                                      _jobApplicationsController!
                                          .jobApplications[_index].statusLabel),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _jobApplicationsController
                            ?.jobApplications[_index].stages.length,
                        itemBuilder: (context, index) => TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.25,
                          isLast: index ==
                                  _jobApplicationsController!
                                          .jobApplications[_index]
                                          .stages
                                          .length -
                                      1
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
                                      _jobApplicationsController!
                                              .jobApplications[_index]
                                              .stages[index]
                                              .scheduledOn ??
                                          DateTime.now(),
                                    ),
                                  ),
                                  Text(
                                    formatDateDD(
                                      _jobApplicationsController!
                                              .jobApplications[_index]
                                              .stages[index]
                                              .scheduledOn ??
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
                                      _jobApplicationsController!
                                          .jobApplications[_index]
                                          .stages[index]
                                          .title,
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
                )
              : Container(),
        ),
      );
    });
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
