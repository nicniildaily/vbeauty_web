import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_links.dart';
import '../../widgets/navigation/app_header.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/common/app_container.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      body: Column(
        children: [
          AppHeader(scrollController: _scrollController),
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      AppContainer(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              AppStrings.contactTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'We\'d love to hear from you.',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 48),
                            _contactCard(
                              context,
                              icon: Icons.email_outlined,
                              label: 'Email',
                              value: AppStrings.contactEmail,
                              onTap: () =>
                                  launchUrl(Uri.parse('mailto:${AppLinks.email}')),
                            ),
                            const SizedBox(height: 24),
                            _contactCard(
                              context,
                              icon: Icons.phone_outlined,
                              label: 'Phone',
                              value: AppStrings.contactPhone,
                              onTap: () =>
                                  launchUrl(Uri.parse('tel:${AppLinks.phone}')),
                            ),
                          ],
                        ),
                      ),
                      const AppFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.lightPurple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.white),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.grayText),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.darkText),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondaryPurple,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
