import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../razorpay_service.dart';

class MerchantCheckoutScreen extends StatefulWidget {
  final String merchantName;
  final String amount;
  final String orderId;

  const MerchantCheckoutScreen({
    super.key,
    required this.merchantName,
    required this.amount,
    required this.orderId,
  });

  @override
  State<MerchantCheckoutScreen> createState() => _MerchantCheckoutScreenState();
}

class _MerchantCheckoutScreenState extends State<MerchantCheckoutScreen> {
  late RazorpayService _razorpayService;

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService();
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Checkout',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildMerchantHeader(),
                  const SizedBox(height: 32),
                  _buildOrderSummary(),
                  const SizedBox(height: 32),
                  _buildPaymentMethods(),
                ],
              ),
            ),
          ),
          _buildPayButton(context),
        ],
      ),
    );
  }

  Widget _buildMerchantHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child:
              const Icon(Icons.storefront, size: 40, color: AppColors.primary),
        ),
        const SizedBox(height: 16),
        Text(widget.merchantName,
            style:
                GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('Order ID: ${widget.orderId}',
            style: GoogleFonts.inter(
                color: AppColors.textSecondary, fontSize: 13)),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Amount',
              style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
          Text('₹${widget.amount}',
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Methods',
            style:
                GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildPaymentOption(
            'UPI Apps', 'Pay via GPay, PhonePe, etc.', Icons.apps, true),
        _buildPaymentOption('Debit / Credit Card', 'Visa, Mastercard, RuPay',
            Icons.credit_card, false),
        _buildPaymentOption(
            'Net Banking', 'All Indian Banks', Icons.account_balance, false),
      ],
    );
  }

  Widget _buildPaymentOption(
      String title, String sub, IconData icon, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border:
            isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
      ),
      child: Row(
        children: [
          Icon(icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                Text(sub,
                    style: GoogleFonts.inter(
                        fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_circle, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5))
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Starting Razorpay Payment...')),
              );
              _razorpayService.openCheckout(
                amount: double.tryParse(widget.amount) ?? 0,
                contact: '8888888888',
                email: 'user@example.com',
                description: 'Payment for Order ID: ${widget.orderId}',
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: Text('Pay ₹${widget.amount}',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
