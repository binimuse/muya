import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muya/app/theme/app_colors.dart';
import 'package:muya/app/theme/app_sizes.dart';
import 'package:muya/app/theme/app_text_styles.dart';
import 'package:muya/gen/assets.gen.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteOff,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6A5B92)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Payment',
          style: AppTextStyles.titleBold.copyWith(
            color: AppColors.grayDefault,
            fontSize: AppSizes.font_16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: AppTextStyles.titleBold.copyWith(
                      color: AppColors.grayDefault,
                      fontSize: AppSizes.font_16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Resume Creation', 'ETB 50.00'),
                  const SizedBox(height: 8),
                  _buildSummaryRow('Tax', 'ETB 5.00'),
                  const Divider(height: 24),
                  _buildSummaryRow(
                    'Total',
                    'ETB 55.00',
                    isBold: true,
                    textColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Payment Methods
            Text(
              'Select Payment Method',
              style: AppTextStyles.displayTwoRegular.copyWith(
                color: AppColors.grayDefault,
                fontSize: AppSizes.font_16,
              ),
            ),
            const SizedBox(height: 16),
            // Telebirr Payment Card
            _buildPaymentMethodCard(
              'Telebirr',
              'Pay with Telebirr',
              Assets.images.telebirr.path,
              () {
                // Handle Telebirr payment
                _showTelebirrPaymentDialog(context);
              },
            ),
            const SizedBox(height: 16),
            // CBE Payment Card
            _buildPaymentMethodCard(
              'CBE',
              'Pay with CBE',
              Assets.images.cbe.path,
              () {
                // Handle CBE payment
                _showCBEPaymentDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
    Color? textColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.displayOneRegular.copyWith(
            color: AppColors.grayDefault,
            fontSize: AppSizes.font_14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.displayOneRegular.copyWith(
            color: textColor ?? AppColors.grayDefault,
            fontSize: AppSizes.font_14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard(
    String title,
    String subtitle,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.whiteOff,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displayOneRegular.copyWith(
                      color: AppColors.grayDefault,
                      fontSize: AppSizes.font_14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.displayOneRegular.copyWith(
                      color: AppColors.grayDefault.withOpacity(0.7),
                      fontSize: AppSizes.font_12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayDefault,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showTelebirrPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Pay with Telebirr',
              style: AppTextStyles.titleBold.copyWith(
                color: AppColors.grayDefault,
                fontSize: AppSizes.font_16,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Scan the QR code below to complete your payment',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.menuBold.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code,
                      size: 150,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Amount: ETB 55.00',
                  style: AppTextStyles.displayOneRegular.copyWith(
                    color: AppColors.grayDefault,
                    fontSize: AppSizes.font_14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.menuRegular.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle payment confirmation
                  Navigator.pop(context);
                  _showPaymentSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'I have paid',
                  style: AppTextStyles.menuRegular.copyWith(
                    color: AppColors.whiteOff,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _showCBEPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Pay with CBE',
              style: AppTextStyles.titleBold.copyWith(
                color: AppColors.grayDefault,
                fontSize: AppSizes.font_16,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Please use the following details to complete your payment',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.menuBold.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
                const SizedBox(height: 20),
                _buildPaymentDetail('Account Number', '1000123456789'),
                const SizedBox(height: 8),
                _buildPaymentDetail('Account Name', 'Muya Resume Builder'),
                const SizedBox(height: 8),
                _buildPaymentDetail('Amount', 'ETB 55.00'),
                const SizedBox(height: 8),
                _buildPaymentDetail(
                  'Reference',
                  'RESUME-${DateTime.now().millisecondsSinceEpoch}',
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.menuRegular.copyWith(
                    color: AppColors.grayDefault,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle payment confirmation
                  Navigator.pop(context);
                  _showPaymentSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'I have paid',
                  style: AppTextStyles.menuRegular.copyWith(
                    color: AppColors.whiteOff,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildPaymentDetail(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteOff,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.menuBold.copyWith(
              color: AppColors.grayDefault,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.menuBold.copyWith(
              color: AppColors.grayDefault,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 64),
                const SizedBox(height: 16),
                Text(
                  'Payment Successful!',
                  style: AppTextStyles.titleBold.copyWith(
                    color: AppColors.grayDefault,
                    fontSize: AppSizes.font_16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your resume will be processed shortly.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to success page or home
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
    );
  }
}
