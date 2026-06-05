import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_links.dart';
import '../common/app_container.dart';
import '../common/primary_button.dart';

class DownloadCtaSection extends StatelessWidget {
  const DownloadCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
      child: AppContainer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryPurple, AppColors.secondaryPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.downloadCtaTitle,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.downloadCtaDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  PrimaryButton(
                    label: AppStrings.googlePlay,
                    variant: ButtonVariant.white,
                    icon: Icons.play_arrow,
                    onPressed: () => launchUrl(Uri.parse(AppLinks.googlePlay)),
                  ),
                  PrimaryButton(
                    label: AppStrings.downloadApk,
                    variant: ButtonVariant.outlined,
                    icon: Icons.download,
                    onPressed: () => launchUrl(Uri.parse(AppLinks.downloadApk)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
