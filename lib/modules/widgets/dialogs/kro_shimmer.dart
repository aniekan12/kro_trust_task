import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KroShimmer extends StatelessWidget {
  const KroShimmer({super.key, this.width, this.height, this.shimmerColor});

  final double? width;
  final double? height;
  final Color? shimmerColor;

  @override
  Widget build(BuildContext context) {
    final color = shimmerColor ?? const Color(0xFFE2E3E6);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: color,
          highlightColor: Color.lerp(color, Colors.white, 0.3)!,
          child: ColoredBox(
            color: color,
          ),
        ),
      ),
    );
  }
}
