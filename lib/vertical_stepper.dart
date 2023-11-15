import 'package:flutter/material.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({
    super.key,
    required this.totalSteps,
    required this.currentStepIndex,
    required this.stepTitles,
    required this.stepDescriptions,
    required this.onTap,
    this.trailing,
    this.passedStepsBackgroundColor,
    this.currentStepBackgroundColor,
    this.nextStepsBackgroundColor,
    this.stepTextColor,
    this.headerTextStyle,
    this.descriptionTextStyle,
  })  : assert(currentStepIndex >= 0),
        assert(currentStepIndex <= totalSteps);

  final int totalSteps;
  final int currentStepIndex;
  final List<String> stepTitles;
  final List<String> stepDescriptions;
  final ValueChanged<int> onTap;
  final Widget? trailing;
  final Color? passedStepsBackgroundColor;
  final Color? currentStepBackgroundColor;
  final Color? nextStepsBackgroundColor;
  final Color? stepTextColor;
  final TextStyle? headerTextStyle;
  final TextStyle? descriptionTextStyle;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(totalSteps, (final int index) => index + 1)
          .map((final int stepIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                onTap(stepIndex);
              },
              leading: Padding(
                padding: const EdgeInsets.all(1.0),
                child: CircleAvatar(
                  backgroundColor: stepIndex < currentStepIndex
                      ? passedStepsBackgroundColor
                      : stepIndex == currentStepIndex
                          ? currentStepBackgroundColor
                          : nextStepsBackgroundColor,
                  child: Text(
                    stepIndex.toString(),
                    style: TextStyle(
                      color: stepTextColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                stepTitles[stepIndex - 1],
                style: headerTextStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              trailing: trailing,
            ),
            if (stepIndex != totalSteps || currentStepIndex == totalSteps) ...[
              Padding(
                padding: const EdgeInsets.only(
                  right: 30.0,
                  left: 30.0,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: stepIndex == currentStepIndex ? 10.0 : 0.0,
                        ),
                        child: const VerticalDivider(),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      if (stepIndex == currentStepIndex)
                        Expanded(
                          child: Text(
                            stepDescriptions[stepIndex - 1],
                            textAlign: TextAlign.justify,
                            style: descriptionTextStyle ??
                                const TextStyle(
                                  fontSize: 12.0,
                                  height: 1.8,
                                ),
                          ),
                        )
                      else
                        const SizedBox(
                          height: 20.0,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ],
        );
      }).toList(),
    );
  }
}
