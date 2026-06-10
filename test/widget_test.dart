import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_tracker/main.dart';

void main() {
  testWidgets('Attendance screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());
    expect(find.text('Attendance'), findsOneWidget);
  });
}