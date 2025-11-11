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

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: _kCardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          
          children: [
            
            // Main layout
            Row(
              children: [
                // Left price strip
                Container(
                  width: _kValuePanelWidth,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: color,
                    
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Right details panel
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title + Apply button
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
                              icon: Icon(
                                Icons.sell_outlined,
                                size: 16,
                                color: color,
                              ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                          child: Text(
                            description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Read More link
                        GestureDetector(
                          onTap: onReadMore,
                          child: Text(
                            'Read more',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              decorationThickness: 0.1,
                              decorationColor: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Perforated holes (visual effect)
            Positioned(
              left: _kValuePanelWidth - _kHoleRadius,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_kHoleCount, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? holeSpacing - _kHoleRadius : 0,
                      bottom: index == _kHoleCount - 1
                          ? holeSpacing - _kHoleRadius
                          : 0,
                    ),
                    child: Container(
                      width: _kHoleRadius * 2,
                      height: _kHoleRadius * 2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
