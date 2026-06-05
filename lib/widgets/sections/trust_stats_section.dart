import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../common/section_title.dart';

class TrustStatsSection extends StatelessWidget {
  const TrustStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.lightPurple,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              SectionTitle(title: AppStrings.trustSectionTitle),
              const SizedBox(height: 40),
              Semantics(
                label: 'Marketplace trust indicators',
                child: Text(
                  'Join a growing community of beauty professionals and shoppers who trust Velmique Beauty for their beauty product needs.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.grayText),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.secondaryPurple,
                ),
                label: const Text(
                  'Join Our Marketplace',
                  style: TextStyle(
                    color: AppColors.secondaryPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
