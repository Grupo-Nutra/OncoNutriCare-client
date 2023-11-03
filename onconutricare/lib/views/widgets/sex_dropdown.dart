import 'package:flutter/material.dart';

class SexDropdown extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> formKey;
  const SexDropdown({Key? key, required this.formKey}) : super(key: key);

  @override
  State<SexDropdown> createState() => _SexDropdownState();
}

class _SexDropdownState extends State<SexDropdown> {
  final List<String> items = [
    'Masculino',
    'Feminino',
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
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            state.didChange(newValue);
          },
          decoration: const InputDecoration(
            labelText: 'Sexo',
            hintText: 'Selecione',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo obrigatório.';
            }
            return null;
          },
        );
      },
    );
  }
}
