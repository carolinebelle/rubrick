import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:rubrick/firebase/db.dart';
import 'package:rubrick/widgets/side_drawer.dart';

void main() {
  const UsersCollection = 'users';

  testWidgets('shows messages', (WidgetTester tester) async {
    // Populate the fake database.
    final db = FakeFirebaseFirestore();
    await db.collection(UsersCollection).add({
      'name': {'first': 'Caroline', 'last': 'Yoon'},
      'contests': [
        {'contest1id': "Contest 1"},
        {'contest2id': "Contest 2"}
      ],
    });

    // Render the widget.
    await tester.pumpWidget(MaterialApp(
        title: 'Side Drawer', home: SideDrawer(DatabaseService(db: db))));
    // Let the snapshots stream fire a snapshot.
    await tester.idle();
    // Re-render.
    await tester.pump();
    // // Verify the output.
    expect(find.text('Contest 1'), findsOneWidget);
    expect(find.text('Contest 2'), findsOneWidget);
  });
}
