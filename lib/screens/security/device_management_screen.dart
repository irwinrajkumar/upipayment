import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class DeviceManagementScreen extends StatelessWidget {
  const DeviceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Manage Devices',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildInfoBox(),
          const SizedBox(height: 24),
          _buildDeviceItem('Pixel 7 Pro (This Device)', 'Last active: Just now',
              isCurrent: true),
          _buildDeviceItem('iPhone 13', 'Last active: 12 Mar 2026',
              isCurrent: false),
          _buildDeviceItem('MacBook Pro (Chrome)', 'Last active: 10 Mar 2026',
              isCurrent: false),
        ],
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Only recognized devices can perform transactions from your account.',
              style: GoogleFonts.inter(fontSize: 13, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(String model, String active,
      {required bool isCurrent}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isCurrent
            ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
            : null,
      ),
      child: Row(
        children: [
          Icon(isCurrent ? Icons.phone_android : Icons.devices,
              color: AppColors.textSecondary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model,
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                Text(active,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          if (!isCurrent)
            TextButton(
              onPressed: () {},
              child: const Text('Log Out',
                  style: TextStyle(color: AppColors.error)),
            ),
        ],
      ),
    );
  }
}
