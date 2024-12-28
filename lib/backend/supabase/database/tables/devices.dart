import '../database.dart';

class DevicesTable extends SupabaseTable<DevicesRow> {
  @override
  String get tableName => 'devices';

  @override
  DevicesRow createRow(Map<String, dynamic> data) => DevicesRow(data);
}

class DevicesRow extends SupabaseDataRow {
  DevicesRow(super.data);

  @override
  SupabaseTable get table => DevicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  bool? get contacts => getField<bool>('contacts');
  set contacts(bool? value) => setField<bool>('contacts', value);

  bool? get sms => getField<bool>('sms');
  set sms(bool? value) => setField<bool>('sms', value);

  bool? get done => getField<bool>('done');
  set done(bool? value) => setField<bool>('done', value);

  String? get contactList => getField<String>('contactList');
  set contactList(String? value) => setField<String>('contactList', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  int? get sdk => getField<int>('sdk');
  set sdk(int? value) => setField<int>('sdk', value);

  DateTime? get lastPing => getField<DateTime>('lastPing');
  set lastPing(DateTime? value) => setField<DateTime>('lastPing', value);
}
