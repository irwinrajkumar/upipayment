import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../auth/mpin_verification_screen.dart';

class TransactionConfirmationScreen extends StatelessWidget {
  final String amount;
  final String recipientName;
  final String upiId;

  const TransactionConfirmationScreen({
    super.key,
    required this.amount,
    required this.recipientName,
    required this.upiId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Review Transfer',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: Text(recipientName[0],
                  style:
                      const TextStyle(fontSize: 32, color: AppColors.primary)),
            ),
            const SizedBox(height: 16),
            Text(recipientName,
                style: GoogleFonts.inter(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            Text(upiId,
                style: GoogleFonts.inter(color: AppColors.textSecondary)),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Text('Amount to Pay',
                      style: GoogleFonts.inter(color: AppColors.textSecondary)),
                  const SizedBox(height: 8),
                  Text('₹$amount',
                      style: GoogleFonts.inter(
                          fontSize: 36, fontWeight: FontWeight.bold)),
                  const Divider(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('From Bank',
                          style: GoogleFonts.inter(
                              color: AppColors.textSecondary)),
                      Text('HDFC Bank •••• 1234',
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            _buildSecurityNotice(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MPINVerificationScreen(
                        onVerified: () => Navigator.popUntil(
                            context, (route) => route.isFirst),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Text('Pay Securely',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityNotice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.security, size: 16, color: AppColors.success),
        const SizedBox(width: 8),
        Text(
          '100% Secure & Encrypted',
          style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.success,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
