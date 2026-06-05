import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryPurple,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Wrap(
                spacing: 24,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _footerLink(context, AppStrings.navHome, '/'),
                  _footerLink(context, AppStrings.navDownload, '/download'),

                  _footerLink(context, AppStrings.navContact, '/contact'),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.footerCopyright,
                style: const TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(BuildContext context, String label, String route) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.white,
        ),
      ),
    );
  }
}
