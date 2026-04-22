import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/payments/merchant_qr_payment/index.dart';
import 'profile/profile_screen.dart';
import 'transactions/transaction_history_screen.dart';
import 'bank/check_balance_screen.dart';
import 'bills/bills_recharges_screen.dart';
import 'bank/upi_lite_screen.dart';
import 'bank/rupay_credit_screen.dart';
import 'payments/pay_contacts_screen.dart';
import 'payments/pay_phone_screen.dart';
import 'payments/bank_transfer_screen.dart';
import 'bills/mobile_recharge_screen.dart';
import 'bills/electricity_bill_screen.dart';
import 'bills/dth_recharge_screen.dart';
import 'notifications/notifications_screen.dart';
import 'bank/wallet_screen.dart';
import 'payments/pay_upi_id_screen.dart';
import 'payments/split_bills_screen.dart';
import 'transactions/transaction_confirmation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                _buildQuickActionsCard(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'People',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildPeopleList(),
                  const SizedBox(height: 30),
                  Text(
                    'Bills & Recharges',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildBillsAndRecharges(),
                  const SizedBox(height: 30),
                  _buildMoreOptions(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final navigator = Navigator.of(context);
          final result = await navigator.push(
            MaterialPageRoute(builder: (context) => const QRScannerScreen()),
          );
          if (result != null && result is String) {
            navigator.push(
              MaterialPageRoute(
                builder: (context) => TransactionConfirmationScreen(
                  amount: '0',
                  recipientName: 'UPI Transaction',
                  upiId: result,
                ),
              ),
            );
          }
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: Text(
          'Scan QR',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      expandedHeight: 120.0,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      backgroundImage: NetworkImage(
                          'https://api.dicebear.com/7.x/avataaars/png?seed=Felix'), // Placeholder
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, User 👋',
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'user@upi',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionItem(Icons.document_scanner_outlined, 'Scan QR',
                    onTap: () async {
                  final navigator = Navigator.of(context);
                  final result = await navigator.push(
                    MaterialPageRoute(
                        builder: (context) => const QRScannerScreen()),
                  );
                  if (result != null && result is String) {
                    navigator.push(
                      MaterialPageRoute(
                        builder: (context) => TransactionConfirmationScreen(
                          amount: '0',
                          recipientName: 'Scanned Receiver',
                          upiId: result,
                        ),
                      ),
                    );
                  }
                }),
                _buildActionItem(Icons.contacts_outlined, 'Pay\nContacts',
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PayContactsScreen()));
                }),
                _buildActionItem(Icons.phone_android_outlined, 'Pay\nPhone',
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PayPhoneScreen()));
                }),
                _buildActionItem(
                    Icons.account_balance_outlined, 'Bank\nTransfer',
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BankTransferScreen()));
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionItem(Icons.alternate_email, 'Pay\nUPI ID',
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PayUPIScreen()));
                }),
                _buildActionItem(Icons.call_received, 'Request\nMoney',
                    onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentRequestScreen()));
                }),
                _buildActionItem(Icons.call_split, 'Split\nBills', onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplitBillsScreen()));
                }),
                _buildActionItem(Icons.more_horiz, 'View\nMore', onTap: () {}),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(color: Color(0xFFEEEEEE)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomAction(
                    Icons.account_balance_wallet_outlined, 'Wallet', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletScreen()),
                  );
                }),
                Container(width: 1, height: 20, color: const Color(0xFFEEEEEE)),
                _buildBottomAction(Icons.bolt_outlined, 'Lite', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UPILiteScreen()),
                  );
                }),
                Container(width: 1, height: 20, color: const Color(0xFFEEEEEE)),
                _buildBottomAction(Icons.credit_card_outlined, 'Rupay',
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RupayCreditScreen()),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction(IconData icon, String label,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleList() {
    final List<Map<String, String>> people = [
      {'name': 'Ramesh', 'seed': 'Mimi'},
      {'name': 'Suresh', 'seed': 'Bella'},
      {'name': 'Alex', 'seed': 'Alex'},
      {'name': 'Dad', 'seed': 'George'},
      {'name': 'Mom', 'seed': 'Mia'},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: people.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: const Icon(Icons.search, color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Search',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }
          final person = people[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/avataaars/png?seed=${person["seed"]}',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  person['name']!,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBillsAndRecharges() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBillAction(Icons.phone_android, 'Mobile\nRecharge',
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MobileRechargeScreen()));
              }),
              _buildBillAction(Icons.lightbulb_outline, 'Electricity',
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ElectricityBillScreen()));
              }),
              _buildBillAction(Icons.tv, 'DTH', onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DTHRechargeScreen()));
              }),
              _buildBillAction(Icons.more_horiz, 'More', onTap: _openBills),
            ],
          ),
        ],
      ),
    );
  }

  void _openBills() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BillsRechargesScreen()),
    );
  }

  Widget _buildBillAction(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.background,
            child: Icon(icon, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreOptions() {
    return Column(
      children: [
        _buildListTile(Icons.history, 'Transaction History', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TransactionHistoryScreen()),
          );
        }),
        const Divider(height: 1, color: Color(0xFFEEEEEE)),
        _buildListTile(Icons.account_balance, 'Check Bank Balance', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckBalanceScreen()),
          );
        }),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 5,
            )
          ],
        ),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 14, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }
}
