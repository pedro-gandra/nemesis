import '../database.dart';

class StatusTable extends SupabaseTable<StatusRow> {
  @override
  String get tableName => 'status';

  @override
  StatusRow createRow(Map<String, dynamic> data) => StatusRow(data);
}

class StatusRow extends SupabaseDataRow {
  StatusRow(super.data);

  @override
  SupabaseTable get table => StatusTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get review => getField<bool>('review');
  set review(bool? value) => setField<bool>('review', value);
}
