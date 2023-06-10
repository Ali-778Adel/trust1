// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sd_configs_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SdConfigsEntityAdapter extends TypeAdapter<SdConfigsEntity> {
  @override
  final int typeId = 21;

  @override
  SdConfigsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SdConfigsEntity(
      pinCode: fields[0] as String?,
      signatureCode: fields[1] as String?,
      secretKey: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SdConfigsEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pinCode)
      ..writeByte(1)
      ..write(obj.signatureCode)
      ..writeByte(2)
      ..write(obj.secretKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SdConfigsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
