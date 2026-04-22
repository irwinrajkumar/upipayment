import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';

class SettlementReportsScreen extends StatelessWidget {
  const SettlementReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Settlement Reports',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          _buildSummaryHeader(),
          Expanded(child: _buildSettlementList()),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: AppColors.surface),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem('Pending', '₹2,450', Colors.orange),
          _buildSummaryItem('Settled', '₹1.2L', Colors.green),
          _buildSummaryItem('Failed', '₹0', Colors.red),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(value,
            style: GoogleFonts.inter(
                fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(label,
            style: GoogleFonts.inter(
                fontSize: 12, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildSettlementList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ID: SETL_982$index' '42',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                  _buildStatusChip('Settled'),
                ],
              ),
              const Divider(height: 24),
              _buildSettlementDetail('Settled Amount', '₹14,500'),
              _buildSettlementDetail('Date', '1$index March 2026'),
              _buildSettlementDetail('Bank Reference', 'RR_98322$index'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Text(status,
          style: const TextStyle(
              color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSettlementDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 12, color: AppColors.textSecondary)),
          Text(value,
              style:
                  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
