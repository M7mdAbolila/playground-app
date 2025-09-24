import 'dart:developer';
import 'package:flutter/material.dart';

import '../data/drug_model.dart';
import '../data/drug_search_service.dart';
import 'drug_option_tile.dart';

class DrugAutocompleteWidget extends StatefulWidget {
  final DrugSearchService searchService;
  final void Function(Drug)? onDrugSelected;
  final String? hintText;
  final InputDecoration? decoration;
  final int maxSuggestions;

  const DrugAutocompleteWidget({
    super.key,
    required this.searchService,
    this.onDrugSelected,
    this.hintText = 'Search for drugs...',
    this.decoration,
    this.maxSuggestions = 10,
  });

  @override
  State<DrugAutocompleteWidget> createState() => _DrugAutocompleteWidgetState();
}

class _DrugAutocompleteWidgetState extends State<DrugAutocompleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<Drug>(
      displayStringForOption: (Drug drug) => drug.tradename,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Drug>.empty();
        }

        try {
          final results = await widget.searchService.searchDrugs(
            textEditingValue.text,
          );
          return results.take(widget.maxSuggestions);
        } catch (e) {
          debugPrint('Error searching drugs: $e');
          return const Iterable<Drug>.empty();
        }
      },
      onSelected: (Drug selection) {
        log('Selected drug: ${selection.tradename}');
        widget.onDrugSelected?.call(selection);
      },
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration:
                  widget.decoration ??
                  InputDecoration(
                    hintText: widget.hintText,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                  ),
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<Drug> onSelected,
            Iterable<Drug> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 250),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Drug drug = options.elementAt(index);
                      return DrugOptionTile(
                        drug: drug,
                        onTap: () => onSelected(drug),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 1);
                    },
                  ),
                ),
              ),
            );
          },
    );
  }
}
