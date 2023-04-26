enum IconConstants {
  microphone('ic_microphone'),
  toogle('ic_toogle');

  final String value;

  const IconConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
}
