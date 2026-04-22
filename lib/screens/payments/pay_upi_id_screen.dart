import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../transactions/transaction_confirmation_screen.dart';

class PayUPIScreen extends StatefulWidget {
  const PayUPIScreen({super.key});

  @override
  State<PayUPIScreen> createState() => _PayUPIScreenState();
}

class _PayUPIScreenState extends State<PayUPIScreen> {
  final TextEditingController _upiController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _showAmountField = false;

  void _onVerify() {
    if (_upiController.text.contains('@')) {
      setState(() {
        _showAmountField = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter a valid UPI ID (e.g. name@bank)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Pay UPI ID',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter UPI ID',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _upiController,
              decoration: InputDecoration(
                hintText: 'example@upi',
                filled: true,
                fillColor: AppColors.surface,
                suffixIcon: IconButton(
                  icon:
                      const Icon(Icons.check_circle, color: AppColors.primary),
                  onPressed: _onVerify,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            ),
            if (_showAmountField) ...[
              const SizedBox(height: 32),
              Text('Enter Amount',
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  prefixStyle: const TextStyle(fontSize: 24),
                  hintText: '0',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _showAmountField
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionConfirmationScreen(
                              amount: _amountController.text,
                              recipientName: _upiController.text
                                  .split('@')[0]
                                  .toUpperCase(),
                              upiId: _upiController.text,
                            ),
                          ),
                        );
                      }
                    : _onVerify,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(_showAmountField ? 'Review Payment' : 'Verify ID',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
