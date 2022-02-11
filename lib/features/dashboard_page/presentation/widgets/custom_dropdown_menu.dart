import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

/// Custom Dropdown Widget
class CustomDropdown extends StatefulWidget {
  /// Initialise Widget
  const CustomDropdown(
      {required this.items,
      required this.initialItem,
      this.onItemSelected,
      Key? key})
      : super(key: key);

  /// Selected item
  final ActiveSymbol? initialItem;

  /// List of items
  final List<ActiveSymbol> items;

  /// onItemSelected Event for dropdown menu
  final ValueChanged<ActiveSymbol?>? onItemSelected;

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
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), border: Border.all()),
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
                  hint: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Select an active symbol',
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87))),
                  isExpanded: true,
                  items: widget.items
                      .map<DropdownMenuItem<ActiveSymbol>>(
                          (ActiveSymbol value) =>
                              DropdownMenuItem<ActiveSymbol>(
                                  value: value,
                                  key: Key('${value.displayName}'),
                                  child: Text('${value.displayName}')))
                      .toList()))));
}
