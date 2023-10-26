import 'package:flutter/material.dart';

class CrnDropdown extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> formKey;
  const CrnDropdown({Key? key, required this.formKey}) : super(key: key);

  @override
  State<CrnDropdown> createState() => _CrnDropdownState();
}

class _CrnDropdownState extends State<CrnDropdown> {
  final List<String> items = [
    'CRN-1',
    'CRN-2',
    'CRN-3',
    'CRN-4',
    'CRN-5',
    'CRN-6',
    'CRN-7',
    'CRN-8',
    'CRN-9',
    'CRN-10',
    'CRN-11',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: widget.formKey,
      builder: (FormFieldState<String> state) {
        return DropdownButtonFormField<String>(
          value: selectedValue,
          items: items
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            state.didChange(newValue);
          },
          decoration: const InputDecoration(
            labelText: 'CRN',
            hintText: 'Selecione um CRN',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O CRN é obrigatório.';
            }

            return null;
          },
        );
      },
    );
  }
}
