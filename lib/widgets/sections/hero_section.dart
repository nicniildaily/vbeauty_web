import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_links.dart';
import '../common/app_container.dart';
import '../common/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AppContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: isMobile ? _buildMobile(context) : _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _buildTextColumn(context)),
        const SizedBox(width: 48),
        Expanded(flex: 5, child: _buildHeroImage()),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        _buildHeroImage(),
        const SizedBox(height: 32),
        _buildTextColumn(context),
      ],
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.appTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.appDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                PrimaryButton(
                  label: AppStrings.googlePlay,
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
        )
        .animate()
        .fadeIn(duration: 800.ms, curve: Curves.easeOut)
        .slideX(begin: -0.1, end: 0, duration: 800.ms, curve: Curves.easeOut);
  }

  Widget _buildHeroImage() {
    return SizedBox(
          height: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'static/images/screenshots/promo1.png',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
          ),
        )
        .animate()
        .fadeIn(duration: 1000.ms)
        .slideY(begin: 0.1, end: 0, duration: 1500.ms, curve: Curves.easeInOut);
  }
}
