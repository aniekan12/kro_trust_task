import 'package:flutter/material.dart';

class AccountTypeDropdown extends StatelessWidget {
  final String? selectedAccountType;
  final ValueChanged<String?> onChanged;
  final List<String> accountTypes;

  factory AccountTypeDropdown.showDropdown({
    required String? selectedAccountType,
    required ValueChanged<String?> onChanged,
    required List<String> accountTypes,
    Key? key,
  }) =>
      AccountTypeDropdown._(
          key: key,
          selectedAccountType: selectedAccountType,
          onChanged: onChanged,
          accountTypes: accountTypes);

  const AccountTypeDropdown._({
    super.key,
    required this.selectedAccountType,
    required this.onChanged,
    required this.accountTypes,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedAccountType,
      onChanged: onChanged,
      items: accountTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      isExpanded: true,
    );
  }
}
