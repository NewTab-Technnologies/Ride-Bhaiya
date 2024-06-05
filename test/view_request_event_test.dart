// view_request_event_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ridebhaiya/bloc/view_request/view_request_event.dart';

void main() {
  group('ViewRequestsEvent', () {
    test('supports value comparisons', () {
      expect(FetchRequests(), FetchRequests());
    });
  });
}
