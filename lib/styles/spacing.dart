/// Tokens de espaciado configurables para el sistema de diseño.
class AoUiSpacing {
  final double xs; // Extra pequeño, ej. para márgenes o paddings muy pequeños
  final double s; // Pequeño
  final double m; // Mediano
  final double l; // Grande
  final double xl; // Extra grande

  const AoUiSpacing({
    this.xs = 4.0,
    this.s = 8.0,
    this.m = 16.0,
    this.l = 24.0,
    this.xl = 32.0,
  });

  /// Instancia por defecto con valores estándar
  static const AoUiSpacing defaultSpacing = AoUiSpacing();

  /// Método para crear una copia con valores modificados (opcional)
  AoUiSpacing copyWith({
    double? xs,
    double? s,
    double? m,
    double? l,
    double? xl,
  }) {
    return AoUiSpacing(
      xs: xs ?? this.xs,
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xl: xl ?? this.xl,
    );
  }
}
