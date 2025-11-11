import 'package:flutter/material.dart';
import 'package:spacez_coupon_task/widgets/coupon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color _kAccent = Color(0xFFC16B3E);
  static const Color _kBannerGreen = Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      // --- APP BAR ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset('assets/logo.png', height: 24, width: 114),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset('assets/menu.png', height: 24),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, color: Colors.grey, thickness: 0.5),
        ),
      ),

      // --- BODY ---
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row directly below appbar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(0, 0),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Coupons',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Coupon cards section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  CouponCard(
                    price: '₹6,900',
                    title: 'LONGSTAY',
                    description:
                        '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                    color: _kAccent,
                    onApply: () {
                      debugPrint('LONGSTAY coupon applied');
                    },
                    onReadMore: () {
                      debugPrint('Read more clicked for LONGSTAY');
                    },
                  ),
                  const SizedBox(height: 12),
                  CouponCard(
                    price: '₹6,900',
                    title: 'LONGSTAY',
                    description:
                        '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                    color: _kAccent,
                    onApply: () {
                      debugPrint('LONGSTAY coupon applied');
                    },
                    onReadMore: () {
                      debugPrint('Read more clicked for LONGSTAY');
                    },
                  ),
                ],
              ),
            ),

            // Payment offers
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Offers:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CouponCard(
                    price: '₹6,900',
                    title: 'LONGSTAY',
                    description:
                        '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                    color: _kAccent,
                    onApply: () {
                      debugPrint('LONGSTAY coupon applied');
                    },
                    onReadMore: () {
                      debugPrint('Read more clicked for LONGSTAY');
                    },
                  ),
                  // Add extra bottom spacing so last card isn't hidden behind sticky bottom
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),

      // --- STICKY BOTTOM SECTION ---
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Green reward banner (sticky)
          Container(
            width: double.infinity,
            color: _kBannerGreen,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              'Book now & Unlock exclusive rewards!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                
                fontSize: 14,
              ),
            ),
          ),

          // Price/reserve bar
          Material(
            elevation: 8,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Price details (left side)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Text(
                              '₹19,500',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '₹16,000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'for 2 nights',
                              style: TextStyle(fontSize: 13, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '24 Apr - 26 Apr | 8 guests ',
                          style: TextStyle(fontSize: 12, color: Colors.black54,decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),

                  // Reserve button (right side)
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Reserve clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text(
                      'Reserve',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
