import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_links.dart';
import '../../widgets/navigation/app_header.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/common/app_container.dart';
import '../../widgets/common/primary_button.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
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
                            Icon(
                              Icons.download_for_offline,
                              size: 80,
                              color: AppColors.secondaryPurple,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Download Velmique Beauty',
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Get the app on your preferred platform.',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            Wrap(
                              spacing: 16,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                PrimaryButton(
                                  label: '${AppStrings.googlePlay} Store',
                                  icon: Icons.play_arrow,
                                  onPressed: () =>
                                      launchUrl(Uri.parse(AppLinks.googlePlay)),
                                ),
                                PrimaryButton(
                                  label: 'Android APK',
                                  variant: ButtonVariant.outlined,
                                  icon: Icons.download,
                                  onPressed: () =>
                                      launchUrl(Uri.parse(AppLinks.downloadApk)),
                                ),
                              ],
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
}
