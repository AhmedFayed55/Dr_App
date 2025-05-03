import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctorSListView extends StatelessWidget {
  const DoctorSListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 35,
        itemBuilder: (context, index) {
          return DoctorsListViewItem();
        },
      ),
    );
  }
}
