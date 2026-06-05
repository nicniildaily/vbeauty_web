import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../common/app_container.dart';
import '../common/primary_button.dart';

class BuyerBenefitsSection extends StatelessWidget {
  const BuyerBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
      child: AppContainer(
        child: isMobile
            ? Column(
                children: [
                  _buildImage(),
                  const SizedBox(height: 40),
                  _buildTextColumn(context),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _buildImage()),
                  const SizedBox(width: 48),
                  Expanded(child: _buildTextColumn(context)),
                ],
              ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://images.unsplash.com/photo-1487412912498-0447578fcca8?w=500&h=600&fit=crop',
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 400,
            color: AppColors.lightPurple,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.secondaryPurple,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 400,
            color: AppColors.lightPurple,
            child: const Center(
              child: Icon(
                Icons.image,
                size: 64,
                color: AppColors.secondaryPurple,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    final benefits = [
      AppStrings.buyerBenefit1,
      AppStrings.buyerBenefit2,
      AppStrings.buyerBenefit3,
      AppStrings.buyerBenefit4,
      AppStrings.buyerBenefit5,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.buyerBenefitsTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.buyerBenefitsDescription,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        ...benefits.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColors.secondaryPurple,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    b,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.darkText),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: AppStrings.getStarted, onPressed: () {}),
      ],
    );
  }
}
