// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_forms_resualt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentFormsResultModelAdapter
    extends TypeAdapter<PaymentFormsResultModel> {
  @override
  final int typeId = 10;

  @override
  PaymentFormsResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentFormsResultModel(
      result: fields[0] as String?,
      cardId: fields[2] as String?,
      logpass: fields[3] as String?,
      msg: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentFormsResultModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.msg)
      ..writeByte(2)
      ..write(obj.cardId)
      ..writeByte(3)
      ..write(obj.logpass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentFormsResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
