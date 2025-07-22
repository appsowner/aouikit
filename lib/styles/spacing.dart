/// Tokens de espaciado configurables para el sistema de diseño.
class AoUiSpacing {
  final double xs; // Extra pequeño, ej. para márgenes o paddings muy pequeños
  final double s; // Pequeño
  final double m; // Mediano
  final double l; // Grande
  final double xl; // Extra grande

  const AoUiSpacing({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });
}
