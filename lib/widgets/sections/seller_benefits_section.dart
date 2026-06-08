import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../common/app_container.dart';
import '../common/primary_button.dart';

class SellerBenefitsSection extends StatelessWidget {
  const SellerBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AppContainer(
      child: isMobile
          ? Column(children: [_buildTextColumn(context), const SizedBox(height: 40), _buildImage()])
          : Row(
              children: [
                Expanded(child: _buildTextColumn(context)),
                const SizedBox(width: 48),
                Expanded(child: _buildImage()),
              ],
            ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        'static/images/screenshots/screen_4.png',
        height: 800,
        width: 800,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    final benefits = [
      AppStrings.sellerBenefit1,
      AppStrings.sellerBenefit2,
      AppStrings.sellerBenefit3,
      AppStrings.sellerBenefit4,
      AppStrings.sellerBenefit5,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.sellerBenefitsTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text(AppStrings.sellerBenefitsDescription, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        ...benefits.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.secondaryPurple, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(b, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.darkText)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: AppStrings.learnMore, onPressed: () {}),
      ],
    );
  }
}
