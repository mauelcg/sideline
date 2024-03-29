import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  factory Address({
    String? id,
    required String placeId,
    required double lattitude,
    required double longitude,
    String? street,
    String? city,
    String? state,
    String? postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
