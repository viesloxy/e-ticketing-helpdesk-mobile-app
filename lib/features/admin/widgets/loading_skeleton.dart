import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

class LoadingSkeleton extends StatefulWidget {
  final int itemCount;

  const LoadingSkeleton({super.key, this.itemCount = 4});

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.itemCount,
          separatorBuilder: (context, index) => const SizedBox(height: AppConstants.spacingMd),
          itemBuilder: (context, index) => _buildSkeletonCard(_animation.value),
        );
      },
    );
  }

  Widget _buildSkeletonCard(double opacity) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBox(width: 80, opacity: opacity),
          const SizedBox(height: AppConstants.spacingSm),
          _buildShimmerBox(width: double.infinity, height: 16, opacity: opacity),
          const SizedBox(height: 4),
          _buildShimmerBox(width: 200, height: 16, opacity: opacity),
          const SizedBox(height: AppConstants.spacingMd),
          Row(
            children: [
              _buildShimmerBox(width: 70, height: 24, opacity: opacity),
              const SizedBox(width: AppConstants.spacingSm),
              _buildShimmerBox(width: 60, height: 24, opacity: opacity),
              const Spacer(),
              _buildShimmerBox(width: 100, height: 14, opacity: opacity),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerBox({
    required double width,
    double height = 12,
    required double opacity,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.textSecondary.withValues(alpha: opacity),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class StatCardSkeleton extends StatelessWidget {
  const StatCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
          ),
          const SizedBox(height: AppConstants.spacingMd),
          Container(
            width: 50,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: AppConstants.spacingXs),
          Container(
            width: 80,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
