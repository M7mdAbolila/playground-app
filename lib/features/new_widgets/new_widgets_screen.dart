import 'package:flutter/material.dart';

import 'absorb_pointer_example/absorb_pointer_example.dart';
import 'drugs_auto_complete_feature/data/drug_repo.dart';
import 'drugs_auto_complete_feature/data/drug_search_service.dart';
import 'drugs_auto_complete_feature/widgets/drags_auto_complete_widget.dart';
import 'selection_area/selectable_text_widget.dart';

class NewWidgetsScreen extends StatelessWidget {
  const NewWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            spacing: 50,
            children: [
              /// Autocomplete widget helping the user make a selection by entering some text and choosing from among a list of options.
              /// Example:
              // Custom autocomplete widget for searching drugs by their tradename.
              DrugAutocompleteWidget(
                searchService: DrugSearchService(JsonDrugRepository()),
              ),

              /// Wrap the widgets you want to be selectable in a SelectionArea.
              /// Example:
              // Text is not selectable by default.
              // To make a Text selectable, one can wrap a subtree with a SelectionArea widget.
              // To exclude a part of a subtree under SelectionArea from selection,
              // once can also wrap that part of the subtree with SelectionContainer.disabled.
              const SelectableTextExampleWidget(),

              /// AbsorbPointer is a widget that prevents its subtree from receiving pointer events.
              /// Example:
              /// The blue button is wrapped in AbsorbPointer, so it does not respond to taps.
              /// The grey button is not wrapped in AbsorbPointer, so it responds to taps.
              /// try tapping on both buttons to see the difference.
              const AbsorbPointerExample(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() =>
      AppBar(title: const Text('New Widgets'), centerTitle: true);
}
