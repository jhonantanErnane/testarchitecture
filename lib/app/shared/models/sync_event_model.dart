import './sync_event_enum.dart';

class SyncEvent {
  final String message;
  final SyncEventEnum eventEnum;

  SyncEvent({required this.message, required this.eventEnum});
}
