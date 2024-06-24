import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/common/gen/assets.gen.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/widgets/buttons/kro_button.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class TransferSuccessTerminal extends StatelessWidget {
  final TransferResponse transferResponse;
  const TransferSuccessTerminal({
    super.key,
    required this.transferResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KroAssets.images.svg.success.svg(),
              30.verticalGap,
              Text(
                'Transfer of ${transferResponse.amount} to ${transferResponse.recepient} was successful',
                style: KroBodyTextStyles.large,
              ),
              30.verticalGap,
              KroButton.primary(
                title: 'Okay',
                isExpanded: false,
                onTap: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
