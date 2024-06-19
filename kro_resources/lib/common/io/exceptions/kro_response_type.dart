// ignore_for_file: constant_identifier_names

enum KroResponseType {
  // 100xx

  ok('00'),
  processing('202'),
  success('200'),

  // 400xx
  BAD_REQUEST('400'),

  BAD_GATEWAY('502'),

  DENIED('99'),

  // UNKNOWN
  UNKNOWN('-1');

  const KroResponseType(this.code);

  final String code;

  static KroResponseType fromCode(String code) {
    return KroResponseType.values.firstWhere(
      (e) => e.code == code,
      orElse: () => KroResponseType.BAD_REQUEST,
    );
  }
}
