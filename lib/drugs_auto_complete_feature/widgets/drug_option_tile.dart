import 'package:flutter/material.dart';

import '../data/drug_model.dart';

class DrugOptionTile extends StatelessWidget {
  final Drug drug;
  final VoidCallback onTap;

  const DrugOptionTile({super.key, required this.drug, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        drug.tradename,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        overflow: TextOverflow.ellipsis,
      ),

      subtitle: Text(
        drug.company,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.teal,
        ),
      ),
      onTap: onTap,
      tileColor: Colors.teal.shade50,
    );
  }
}
