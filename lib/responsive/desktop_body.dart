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
      body: const Padding(
        padding: EdgeInsets.all(SpacingConst.small),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Row Header
            TopRowHeaderContainer(),
            // Contents
            Expanded(
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

      // Footer Row
      persistentFooterButtons: [
        FooterContainer(timeString: _timeString),
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

class TopRowHeaderContainer extends StatelessWidget {
  const TopRowHeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(SpacingConst.small),
                child: Container(
                  color: Colors.blueAccent[400],
                  height: SizeConstants.topRowHeader,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FirstColumnContainer extends StatelessWidget {
  const FirstColumnContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SpacingConst.small),
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
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(RadiusConst.small),
                      bottomRight: Radius.circular(RadiusConst.small),
                    ),
                  ),
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
            const FirstColumnButtonRow(),
          ],
        ),
      ),
    );
  }
}

class FirstColumnButtonRow extends StatelessWidget {
  const FirstColumnButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: SizeConstants.buttonRow,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: SpacingConst.small),
            CustomButton(text: StringConstants.exit, color: ColorConstants.black),
            SizedBox(width: SpacingConst.small),
            CustomButton(text: StringConstants.reprint, color: ColorConstants.darkPurple),
            SizedBox(width: SpacingConst.small),
            CustomButton(text: StringConstants.specialTrans, color: ColorConstants.darkPurple, overflow: TextOverflow.visible),
            SizedBox(width: SpacingConst.small),
            CustomButton(text: StringConstants.checkout, color: ColorConstants.green),
          ],
        ),
      ),
    );
  }
}

class SecondColumnContainer extends StatelessWidget {
  const SecondColumnContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(SpacingConst.small),
        child: Container(
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }
}

class FooterContainer extends StatelessWidget {
  const FooterContainer({Key? key, required String timeString})
      : _timeString = timeString,
        super(key: key);

  final String _timeString;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.black,
      height: SizeConstants.huge,
      margin: const EdgeInsets.symmetric(horizontal: SpacingConst.small),
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
    );
  }
}
