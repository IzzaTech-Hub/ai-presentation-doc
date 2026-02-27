/// Represents a color/visual theme for the AI-generated presentation.
class ColorTheme {
  final String id;
  final String name;
  final String emoji;
  final String primaryColor;
  final String secondaryColor;
  final String accentColor;
  final String fontFamily;
  final String styleDescription;
  final List<String> gradientColors; // used for UI preview swatch

  const ColorTheme({
    required this.id,
    required this.name,
    required this.emoji,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.fontFamily,
    required this.styleDescription,
    required this.gradientColors,
  });

  /// Returns a short block that gets appended to the AI user prompt.
  String toPromptBlock() {
    return '''
[THEME] "$name": Colors($primaryColor, $secondaryColor, $accentColor), Font($fontFamily). 
Style: $styleDescription. Use linear-gradient(135deg, $primaryColor 0%, $secondaryColor 100%) for main backgrounds.
''';
  }
}

/// Represents a slide/section layout structure for the presentation.
class LayoutTemplate {
  final String id;
  final String name;
  final String emoji;
  final String shortDescription;
  final List<String> requiredSections;
  final String layoutDescription;

  const LayoutTemplate({
    required this.id,
    required this.name,
    required this.emoji,
    required this.shortDescription,
    required this.requiredSections,
    required this.layoutDescription,
  });

  /// Returns a short block that gets appended to the AI user prompt.
  String toPromptBlock() {
    return '''
[LAYOUT] "$name": $shortDescription.
Sections: ${requiredSections.join(', ')}.
Structure: $layoutDescription.
''';
  }
}
