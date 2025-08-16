import 'package:flutter/material.dart';
import '../includes.dart';

// ignore: must_be_immutable
class SurveyProgressIndicator extends StatelessWidget {
  SurveyProgressIndicator({
    super.key,
    required this.page,
    required this.progress,
  });

  final int page;
  double progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page == 1 ? progress : 100,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 2
                      ? page > 2
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 3
                      ? page > 3
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 4
                      ? page > 4
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 5
                      ? page > 5
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 6
                      ? page > 6
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 7
                      ? page > 7
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 8
                      ? page > 8
                      ? 100
                      : progress
                      : 0,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 25,
                height: 4,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xD3F1F1F1),
                  color: Color(accentColor),
                  value: page >= 9
                      ? page > 9
                      ? 100
                      : progress
                      : 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    "assets/images/NutriTracker.svg",
                    colorFilter: ColorFilter.mode(
                      Color(primaryColor),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  "Let's get to know you better",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
