import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class MPINVerificationScreen extends StatefulWidget {
  final VoidCallback onVerified;
  const MPINVerificationScreen({super.key, required this.onVerified});

  @override
  State<MPINVerificationScreen> createState() => _MPINVerificationScreenState();
}

class _MPINVerificationScreenState extends State<MPINVerificationScreen> {
  String _pin = '';

  void _onKeyTap(String key) {
    if (_pin.length < 4) {
      setState(() => _pin += key);
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() => _pin = _pin.substring(0, _pin.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Enter UPI PIN',
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Confirm payment from your bank account',
            style: GoogleFonts.inter(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < _pin.length
                      ? AppColors.primary
                      : Colors.grey[300],
                ),
              );
            }),
          ),
          const Spacer(),
          _buildKeypad(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['1', '2', '3'].map((k) => _buildKey(k)).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['4', '5', '6'].map((k) => _buildKey(k)).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['7', '8', '9'].map((k) => _buildKey(k)).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 60),
              _buildKey('0'),
              _buildKey('del',
                  icon: Icons.backspace_outlined, onTap: _onDelete),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String label, {IconData? icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ??
          () {
            _onKeyTap(label);
            if (_pin.length == 4) widget.onVerified();
          },
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: icon != null
            ? Icon(icon, color: AppColors.textPrimary)
            : Text(label,
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
