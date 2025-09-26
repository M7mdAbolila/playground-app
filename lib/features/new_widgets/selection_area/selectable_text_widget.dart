import 'package:flutter/material.dart';

class SelectableTextExampleWidget extends StatelessWidget {
  const SelectableTextExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selectable text', style: _buildSelectableTextStyle()),
          SelectionContainer.disabled(
            child: Text(
              'Non-selectable text',
              style: _buildNonSelectableTextStyle(),
            ),
          ),
          Text('Selectable text', style: _buildSelectableTextStyle()),
        ],
      ),
    );
  }

  TextStyle _buildSelectableTextStyle() {
    return const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _buildNonSelectableTextStyle() {
    return const TextStyle(
      fontSize: 24,
      color: Colors.grey,
      fontStyle: FontStyle.italic,
    );
  }
}
