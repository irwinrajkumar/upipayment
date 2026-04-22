import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class DTHRechargeScreen extends StatelessWidget {
  const DTHRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('DTH Recharge',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        children: List.generate(6, (index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tv, size: 40, color: AppColors.primary),
                const SizedBox(height: 8),
                Text('Operator ${index + 1}',
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
