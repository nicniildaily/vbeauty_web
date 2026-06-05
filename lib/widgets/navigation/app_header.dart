import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class AppHeader extends StatefulWidget {
  final ScrollController scrollController;

  const AppHeader({super.key, required this.scrollController});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isVisible = true;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    if (offset > 100) {
      if (offset > _lastOffset && _isVisible) {
        setState(() => _isVisible = false);
      } else if (offset < _lastOffset && !_isVisible) {
        setState(() => _isVisible = true);
      }
    } else {
      if (!_isVisible) setState(() => _isVisible = true);
    }
    _lastOffset = offset;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return ClipRect(
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        heightFactor: _isVisible ? 1.0 : 0.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: isMobile
                    ? _buildMobileNav(context)
                    : _buildDesktopNav(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Row(
          children: [
            _navLink(context, AppStrings.navHome, '/'),
            const SizedBox(width: 32),
            _navLink(context, AppStrings.navDownload, '/download'),
            const SizedBox(width: 32),
            _navLink(context, AppStrings.navContact, '/contact'),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.white),
            onPressed: () => Scaffold.of(ctx).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Image.asset(
        'static/icons/logo.png',
        height: 56,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _navLink(BuildContext context, String label, String route) {
    final isActive = GoRouterState.of(context).uri.toString() == route;
    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.secondaryPurple : AppColors.white,
          decoration: isActive ? TextDecoration.underline : null,
          decorationColor: AppColors.secondaryPurple,
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth * 0.5,
      child: Container(
        color: AppColors.primaryPurple,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: AppColors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 40),
                _drawerLink(context, AppStrings.navHome, '/'),
                const SizedBox(height: 24),
                _drawerLink(context, AppStrings.navDownload, '/download'),
                const SizedBox(height: 24),
                _drawerLink(context, AppStrings.navContact, '/contact'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerLink(BuildContext context, String label, String route) {
    final isActive = GoRouterState.of(context).uri.toString() == route;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.secondaryPurple : AppColors.white,
          decoration: isActive ? TextDecoration.underline : null,
        ),
      ),
    );
  }
}
