import 'dart:async';

import 'package:demoslicingflutter/constants/ui_constants.dart';
import 'package:demoslicingflutter/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        title: const Text(StringConstants.desktopTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Row Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blueAccent[400],
                          height: SizeConstants.topRowHeader,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Contents
            const Expanded(
              child: Row(
                children: [
                  // First Column
                  FirstColumnContainer(),
                  // Second Column
                  SecondColumnContainer()
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          color: ColorConstants.black,
          height: SizeConstants.huge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: SpacingConst.small),
              CustomText(
                text: _timeString,
                fontSize: SizeConstants.tiny,
                color: ColorConstants.white,
              ),
              const SizedBox(width: SpacingConst.tiny),
              const Flexible(
                child: CustomText(
                  text: StringConstants.footer,
                  fontSize: SizeConstants.tiny,
                  color: ColorConstants.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEE, MM/dd/yyyy - hh:mm:ss').format(dateTime);
  }
}

class FirstColumnContainer extends StatelessWidget {
  const FirstColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 6,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: SpacingConst.small,
                      top: SpacingConst.small,
                      right: SpacingConst.small + 6,
                      bottom: SpacingConst.small,
                    ),
                    child: Container(
                      color: Colors.deepPurple[300],
                      height: 100,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent[400],
            margin: const EdgeInsets.all(SpacingConst.small),
            height: 90,
            child: Row(children: [
              Container(
                width: 25,
                color: Colors.purple,
                height: double.maxFinite,
                child: const Center(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: CustomText(
                      text: StringConstants.orderList,
                      fontSize: SizeConstants.tiny,
                      color: ColorConstants.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // First Column Button Row
          Container(
            color: Colors.brown,
            margin: const EdgeInsets.all(SpacingConst.small),
            height: SizeConstants.buttonRow,
          ),
        ],
      ),
    );
  }
}

class SecondColumnContainer extends StatelessWidget {
  const SecondColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 500,
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }
}
