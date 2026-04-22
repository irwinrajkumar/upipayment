import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';

class PaymentRequestScreen extends StatelessWidget {
  const PaymentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Request Payment',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildRequestCard(),
            const SizedBox(height: 32),
            _buildShareOptions(),
            const SizedBox(height: 32),
            _buildRecentRequests(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.primary,
          AppColors.primary.withValues(alpha: 0.8)
        ]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text('Enter Amount to Request',
              style: GoogleFonts.inter(color: Colors.white70)),
          const SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            decoration: const InputDecoration(
              prefixText: '₹ ',
              prefixStyle: TextStyle(color: Colors.white, fontSize: 32),
              border: InputBorder.none,
              hintText: '0',
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Add a note (e.g. Dinner share)',
              hintStyle: const TextStyle(color: Colors.white38),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.1),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Generate Link & Share',
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildShareIcon(Icons.link, 'Copy Link', Colors.blue),
            _buildShareIcon(Icons.message, 'WhatsApp', Colors.green),
            _buildShareIcon(Icons.qr_code, 'Show QR', AppColors.primary),
          ],
        ),
      ],
    );
  }

  Widget _buildShareIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(label,
            style:
                GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildRecentRequests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Requests',
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildRequestItem('To Ramesh', '₹450', 'Pending', Colors.orange),
        _buildRequestItem('To Suresh', '₹1,200', 'Paid', Colors.green),
      ],
    );
  }

  Widget _buildRequestItem(
      String name, String amount, String status, Color statusColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
          backgroundColor: AppColors.surface,
          child: Icon(Icons.person_outline)),
      title: Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      subtitle: Text('Status: $status',
          style: TextStyle(color: statusColor, fontSize: 12)),
      trailing:
          Text(amount, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
    );
  }
}
