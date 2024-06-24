import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/kro_size_config.dart';
import 'package:kro_trust_task/modules/widgets/dialogs/kro_shimmer.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class KroLoader extends StatelessWidget {
  const KroLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.pxToHeight(1000),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KroShimmer(
                          height: 20,
                          width: 60,
                        ),
                        KroShimmer(
                          height: 20,
                          width: 100,
                        ),
                      ],
                    ),
                    4.verticalGap,
                    const KroShimmer(
                      height: 20,
                      width: 100,
                    ),
                    4.verticalGap,
                    const KroShimmer(
                      height: 20,
                      width: 100,
                    ),
                  ]));
        },
      ),
    );
  }
}
