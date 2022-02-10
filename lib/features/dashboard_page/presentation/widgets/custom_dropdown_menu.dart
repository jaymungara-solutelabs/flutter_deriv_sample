import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_sample/generated/l10n.dart';

class CustomDropdown extends StatefulWidget {
  final ActiveSymbol? initialItem;
  final List<ActiveSymbol> items;
  final ValueChanged<ActiveSymbol?>? onItemSelected;
  const CustomDropdown(
      {required this.items,
      required this.initialItem,
      this.onItemSelected,
      Key? key})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  ActiveSymbol? _item;

  @override
  void initState() {
    super.initState();
    _item = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1)),
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<ActiveSymbol>(
                    value: _item,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (ActiveSymbol? newValue) {
                      widget.onItemSelected!(newValue);
                      setState(() {
                        _item = newValue!;
                      });
                    },
                    hint: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(S.of(context).selectActiveSymbol,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87))),
                    isExpanded: true,
                    items: widget.items
                        .map<DropdownMenuItem<ActiveSymbol>>(
                            (ActiveSymbol value) => DropdownMenuItem(
                                value: value,
                                child: Text('${value.displayName}')))
                        .toList()))));
  }
}
