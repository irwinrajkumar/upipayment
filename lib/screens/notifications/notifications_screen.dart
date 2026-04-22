import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import 'payment_status_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader('Today'),
          const SizedBox(height: 12),
          _buildNotificationItem(
            context: context,
            type: 'cashback',
            title: 'Cashback Earned!',
            message: 'You received ₹50 cashback on your last Zomato order.',
            time: '2 mins ago',
            icon: Icons.card_giftcard,
            iconColor: AppColors.success,
          ),
          _buildNotificationItem(
            context: context,
            type: 'security',
            title: 'Security Alert',
            message: 'New login detected from a Chrome browser on Windows.',
            time: '1 hour ago',
            icon: Icons.security,
            iconColor: AppColors.error,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Yesterday'),
          const SizedBox(height: 12),
          _buildNotificationItem(
            context: context,
            type: 'reminder',
            title: 'Payment Reminder',
            message: 'Your Electricity Bill for ₹1,240 is due tomorrow.',
            time: 'Yesterday',
            icon: Icons.calendar_today,
            iconColor: Colors.orange,
          ),
          _buildNotificationItem(
            context: context,
            type: 'offer',
            title: 'New Offer!',
            message: 'Get 20% off on your next Gas payment via UPI Lite.',
            time: 'Yesterday',
            icon: Icons.local_offer_outlined,
            iconColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildNotificationItem({
    required BuildContext context,
    required String type,
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        if (type == 'cashback') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentStatusScreen(
                isSuccess: true,
                amount: '50',
                recipient: 'Cashback Reward',
                transactionId: 'TXN987654321',
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        time,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
