import 'package:flutter/material.dart';

class NutriDiagnosisDropdown extends StatefulWidget {
  final GlobalKey<FormFieldState<String>> formKey;
  const NutriDiagnosisDropdown({Key? key, required this.formKey})
      : super(key: key);

  @override
  State<NutriDiagnosisDropdown> createState() => _NutriDiagnosisDropdownState();
}

class _NutriDiagnosisDropdownState extends State<NutriDiagnosisDropdown> {
  final List<String> items = [
    'Baixo peso',
    'Desnutrição',
    'Caquexia',
    'Miopenia',
    'Sarcopenia',
    'Sobrepeso',
    'Obesidade'
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
            labelText: 'Diagnóstico Nutricional',
            hintText: 'Selecione um diagnóstico',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O diagnóstico é obrigatório.';
            }

            return null;
          },
        );
      },
    );
  }
}
