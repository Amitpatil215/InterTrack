import 'package:flutter/material.dart';
import 'package:intertrack/Utils/utils.dart';

class NavigateToDebugButton extends StatelessWidget {
  const NavigateToDebugButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Constant.routeDebug);
        },
        child: Text('Debug Button'));
  }
}
