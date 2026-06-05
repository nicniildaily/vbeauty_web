import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../common/app_container.dart';
import '../common/section_title.dart';
import '../common/screenshot_card.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AppContainer(
      child: Column(
        children: [
          SectionTitle(
            title: AppStrings.howItWorksTitle,
            subtitle: AppStrings.howItWorksDescription,
          ),
          const SizedBox(height: 48),
          if (isMobile)
            Column(
              children: _buildSteps()
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: _buildStepCard(
                        context,
                        e.value.$1,
                        e.value.$2,
                        e.key,
                      ),
                    ),
                  )
                  .toList(),
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildSteps()
                  .asMap()
                  .entries
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: e.key > 0 ? 16 : 0,
                          right: e.key < 2 ? 16 : 0,
                        ),
                        child: _buildStepCard(
                          context,
                          e.value.$1,
                          e.value.$2,
                          e.key,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  List<(String, String)> _buildSteps() {
    return [
      (AppStrings.step1Title, AppStrings.step1Description),
      (AppStrings.step2Title, AppStrings.step2Description),
      (AppStrings.step3Title, AppStrings.step3Description),
    ];
  }

  Widget _buildStepCard(
    BuildContext context,
    String title,
    String description,
    int index,
  ) {
    final screenshots = [
      const AssetImage('static/images/screenshots/screen_1.png'),
      const AssetImage('static/images/screenshots/screen_2.png'),
      const AssetImage('static/images/screenshots/screen_3.png'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: ScreenshotCard(
            image: screenshots[index],
            height: 300,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.primaryPurple,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
