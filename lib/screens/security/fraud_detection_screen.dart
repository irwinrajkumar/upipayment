import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class FraudDetectionScreen extends StatelessWidget {
  const FraudDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Security Center',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRiskScoreCard(),
            const SizedBox(height: 32),
            Text('Fraud Detection Tools',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSecurityTool(Icons.verified_user_outlined,
                'Real-time AI Scan', 'Active', Colors.green),
            _buildSecurityTool(Icons.location_on_outlined,
                'Location Verification', 'Restricted', Colors.orange),
            _buildSecurityTool(Icons.pattern, 'Behavior Analytics', 'Learning',
                AppColors.primary),
            const SizedBox(height: 32),
            _buildAlertSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskScoreCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green.shade700, Colors.green.shade500]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text('Your Security Level',
              style: GoogleFonts.inter(color: Colors.white70)),
          const SizedBox(height: 8),
          Text('SECURE',
              style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 16),
          const LinearProgressIndicator(
              value: 0.9, backgroundColor: Colors.white24, color: Colors.white),
          const SizedBox(height: 8),
          Text('92% Protection Score',
              style: GoogleFonts.inter(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildSecurityTool(
      IconData icon, String title, String status, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      subtitle:
          Text('Status: $status', style: TextStyle(color: color, fontSize: 12)),
      trailing: Switch(value: true, onChanged: (v) {}),
    );
  }

  Widget _buildAlertSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.orange),
              const SizedBox(width: 12),
              Text('Recent Security Alerts',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'No suspicious activities detected in the last 30 days.',
            style:
                GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
