import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/jobApplications_controller.dart';
import 'package:intertrack/Utils/utils.dart';

class JobApplicationsList extends StatelessWidget {
  const JobApplicationsList({
    Key? key,
    required JobApplicationsController controller,
  })   : _jobApplicationController = controller,
        super(key: key);
  final JobApplicationsController _jobApplicationController;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: _jobApplicationController.jobApplications.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _jobApplicationController.selectedJobApplicationId.value =
                  _jobApplicationController.jobApplications[index].id;
              Navigator.of(context)
                  .pushNamed(Constant.routeJobApplicationDetails)
                  .then((value) {
                _jobApplicationController.resetSelectedJobApplicationId();
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Responsive().mediumW,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      _jobApplicationController.jobApplications[index].position,
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
                            Text(describeEnum(_jobApplicationController
                                .jobApplications[index].jobType)),
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
                            Text(
                              'Applied on ${formatDateDDthMMM(_jobApplicationController.jobApplications[index].dateOfApplication ?? DateTime.now())}',
                            ),
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
                      _jobApplicationController
                          .jobApplications[index].companyName,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Responsive().smallW),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clock,
                            size: Responsive().width * 0.03,
                          ),
                          SizedBox(width: Responsive().smallW),
                          Text(
                            _jobApplicationController
                                .jobApplications[index].stages.length
                                .toString(),
                          ),
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
                              describeEnum(_jobApplicationController
                                  .jobApplications[index].statusLabel),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
