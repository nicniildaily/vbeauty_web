import 'package:flutter/material.dart';
import '../../widgets/navigation/app_header.dart';
import '../../widgets/footer/app_footer.dart';
import '../../widgets/sections/hero_section.dart';
import '../../widgets/sections/trust_stats_section.dart';
import '../../widgets/sections/how_it_works_section.dart';
import '../../widgets/sections/buyer_benefits_section.dart';
import '../../widgets/sections/seller_benefits_section.dart';
import '../../widgets/sections/download_cta_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      const HeroSection(),
                      const TrustStatsSection(),
                      const HowItWorksSection(),
                      const BuyerBenefitsSection(),
                      const SellerBenefitsSection(),
                      const DownloadCtaSection(),
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
