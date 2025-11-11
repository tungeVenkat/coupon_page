import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String price;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onApply;
  final VoidCallback onReadMore;

  const CouponCard({
    super.key,
    required this.price,
    required this.title,
    required this.description,
    required this.color,
    required this.onApply,
    required this.onReadMore,
  });

  static const double _kValuePanelWidth = 80.0;
  static const double _kHoleRadius = 5.0;
  static const int _kHoleCount = 8;
  static const double _kCardHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final double holeSpacing = _kCardHeight / (_kHoleCount + 1);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        child: Row(
          children: [
            // Left color strip
            Container(
              width: _kValuePanelWidth,
              height: _kCardHeight,
              color: color,
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),

            // Right section
            Expanded(
              child: Container(
                height: _kCardHeight,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title & Apply
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: onApply,
                          icon: Icon(Icons.sell_outlined, color: color, size: 18),
                          label: Text(
                            'Apply',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Description
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Read More
                    GestureDetector(
                      onTap: onReadMore,
                      child: const Text(
                        'Read more',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Perforated holes
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_kHoleCount, (i) {
                    return Container(
                      width: _kHoleRadius * 2,
                      height: _kHoleRadius * 2,
                      margin: EdgeInsets.symmetric(
                          vertical: holeSpacing / (_kHoleCount + 1)),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
