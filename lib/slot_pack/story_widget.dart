import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const_colors.dart';
import 'game/shooter_widget.dart';

class StoryScreenWidget extends StatefulWidget {
  final int numberOfScreen;
  const StoryScreenWidget({Key? key, required this.numberOfScreen})
      : super(key: key);
  @override
  State<StoryScreenWidget> createState() => _StoryScreenWidgetState();
}

class _StoryScreenWidgetState extends State<StoryScreenWidget> {
  int _questionsNumber = 1;
  @override
  void initState() {
    _questionsNumber = widget.numberOfScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: Future.value(true),
            builder: (BuildContext context, AsyncSnapshot<void> snap) {
              if (!snap.hasData) {
                return const SizedBox.shrink();
              }
              return Stack(
                children: [
                  Image.asset(
                    'packages/${AppColors.myPackage}/assets/images/$_questionsNumber.png',
                    width: 428.w,
                    height: 926.h,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _questionsNumber++;
                        });
                        if (_questionsNumber == 3) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const RogueShooterWidget(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                    ),
                  )
                ],
              );
            }));
  }
}
