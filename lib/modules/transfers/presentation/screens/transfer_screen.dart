import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/presentation/bloc/transfer/transfer_bloc.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_success_terminal.dart';
import 'package:kro_trust_task/modules/transfers/presentation/widgets/account_type_drop_down.dart';
import 'package:kro_trust_task/modules/widgets/alerts/kro_alerts.dart';
import 'package:kro_trust_task/modules/widgets/app_bar/kro_app_bar.dart';
import 'package:kro_trust_task/modules/widgets/buttons/kro_button.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String? _selectedFromAccount;

  final List<String> _accountTypes = [
    'Savings',
    'Checking',
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<TransferBloc>();
    return Scaffold(
      backgroundColor: KroColors.smoke,
      appBar: KroAppBar.primary(
        title: 'Transfer',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('From Account', style: KroBodyTextStyles.small),
                8.verticalGap,
                AccountTypeDropdown.showDropdown(
                  selectedAccountType: _selectedFromAccount,
                  onChanged: (value) {
                    setState(() {
                      _selectedFromAccount = value;
                    });
                  },
                  accountTypes: _accountTypes,
                ),
                16.verticalGap,
                KroTextField.text(
                    inputController: bloc.form.accountNumberController,
                    labelText: 'Account Number',
                    hintText: 'Account Number'),
                16.verticalGap,
                KroTextField.text(
                    inputController: bloc.form.amountController,
                    labelText: 'Amount',
                    hintText: 'Amount'),
                16.verticalGap,
                BlocConsumer<TransferBloc, BaseBlocState<TransferResponse>>(
                  listener: (context, state) {
                    state.when(
                        init: () {},
                        loading: () {},
                        next: (next) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return TransferSuccessTerminal(
                                  transferResponse: next,
                                );
                              });
                        },
                        error: (error) {
                          KroAlerts.error(
                              message: error.description, context: context);
                        });
                  },
                  builder: (context, state) {
                    return state.when(
                        init: () => KroButton.primary(
                              title: 'Transfer',
                              state: bloc.form.validState,
                              onTap: () =>
                                  bloc.add(TransferEvent.transferMoney()),
                              isExpanded: true,
                            ),
                        loading: () => KroButton.primary(
                              title: 'Transferring...',
                              onTap: () {},
                              isExpanded: true,
                              isLoading: true,
                              state: ValueNotifier(false),
                            ),
                        next: (data) => KroButton.primary(
                              title: 'Transfer',
                              onTap: () =>
                                  bloc.add(TransferEvent.transferMoney()),
                              isExpanded: true,
                              isLoading: false,
                              state: bloc.form.validState,
                            ),
                        error: (error) => KroButton.primary(
                              title: 'Transfer',
                              onTap: () =>
                                  bloc.add(TransferEvent.transferMoney()),
                              isExpanded: true,
                              isLoading: false,
                              state: bloc.form.validState,
                            ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
