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

// import 'package:flutter/material.dart';
// import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
//
// /// A [DropdownButton] with items of type [T]
// class DropDownMenu<T> extends StatefulWidget {
//   /// DropDownMenu Initializer
//   const DropDownMenu({
//     required this.items,
//     required this.initialItem,
//     this.title = '',
//     this.onItemSelected,
//     Key? key,
//   }) : super(key: key);
//
//   /// Title of a widget to show before DropDown menu
//   final String title;
//
//   /// List of items
//   final List<T> items;
//
//   /// Initial item
//   final T? initialItem;
//
//   /// Will be called whenever a new item is selected
//   // final void Function<T>(T item)? onItemSelected;
//   final ValueChanged<T?>? onItemSelected;
//
//   @override
//   _DropDownMenuState<T> createState() => _DropDownMenuState<T>();
// }
//
// class _DropDownMenuState<T> extends State<DropDownMenu<T>> {
//   T? _item;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _item = widget.initialItem;
//   }
//
//   @override
//   Widget build(BuildContext context) => Row(
//         children: <Widget>[
//           Text('${widget.title ?? 'Select an active symbol'}',
//               style: const TextStyle(color: Colors.indigo)),
//           const SizedBox(width: 12),
//           DropdownButton<ActiveSymbol>(
//               value: _item,
//               icon: const Icon(Icons.keyboard_arrow_down),
//               underline: Container(height: 2, color: Colors.grey),
//               onChanged: (ActiveSymbol? newValue) {
//                 widget.onItemSelected!(newValue);
//                 setState(() {
//                   _item = newValue;
//                 });
//               },
//               items: widget.items
//                   .map<DropdownMenuItem>((ActiveSymbol value) =>
//                       DropdownMenuItem(value: value, child: Text('$value')))
//                   .toList()),
//         ],
//       );
// }
