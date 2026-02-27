import '../models/template_model.dart';

class PresentationTemplates {
  // ─── COLOR THEMES ─────────────────────────────────────────────────────────

  static const List<ColorTheme> colorThemes = [
    ColorTheme(
      id: 'ocean_blue',
      name: 'Ocean Blue',
      emoji: '🌊',
      primaryColor: '#0D1B2A',
      secondaryColor: '#1B4F8A',
      accentColor: '#00D4FF',
      fontFamily: "'Inter', 'Roboto', sans-serif",
      gradientColors: ['#0D1B2A', '#1B4F8A'],
      styleDescription:
          'Deep navy-to-blue glassmorphism style. Use frosted-glass cards '
          '(rgba white overlays, backdrop-filter blur), subtle cyan accents, '
          'and modern clean typography. Borders in rgba(0,212,255,0.3).',
    ),
    ColorTheme(
      id: 'forest_green',
      name: 'Forest Green',
      emoji: '🌿',
      primaryColor: '#1A3A2A',
      secondaryColor: '#2E7D52',
      accentColor: '#4CAF50',
      fontFamily: "'Outfit', 'Poppins', sans-serif",
      gradientColors: ['#1A3A2A', '#2E7D52'],
      styleDescription:
          'Deep forest-green corporate style. Clean card layouts with '
          'mint-green highlights, subtle leaf-inspired borders, and a '
          'professional, fresh aesthetic with excellent readability.',
    ),
    ColorTheme(
      id: 'sunset',
      name: 'Sunset',
      emoji: '🌅',
      primaryColor: '#2D0A0A',
      secondaryColor: '#B5451B',
      accentColor: '#FF6B35',
      fontFamily: "'Montserrat', 'Roboto', sans-serif",
      gradientColors: ['#2D0A0A', '#B5451B'],
      styleDescription:
          'Bold warm sunset palette. Deep crimson-to-orange gradients with '
          'fiery accent highlights. Use high-contrast white text, warm shadows, '
          'and energetic micro-animations for a dynamic, powerful feel.',
    ),
    ColorTheme(
      id: 'dark_mode',
      name: 'Dark Mode',
      emoji: '🌑',
      primaryColor: '#0F0F0F',
      secondaryColor: '#1E1B4B',
      accentColor: '#A855F7',
      fontFamily: "'Space Grotesk', 'Inter', sans-serif",
      gradientColors: ['#0F0F0F', '#1E1B4B'],
      styleDescription:
          'Premium dark tech aesthetic. Near-black background with deep '
          'indigo panels. Neon purple accent glow (box-shadow with purple), '
          'monospace font accents for data, and sharp modern UI.',
    ),
    ColorTheme(
      id: 'corporate_gray',
      name: 'Corporate',
      emoji: '💼',
      primaryColor: '#1A1A2E',
      secondaryColor: '#16213E',
      accentColor: '#0F3460',
      fontFamily: "'IBM Plex Sans', 'Roboto', sans-serif",
      gradientColors: ['#1A1A2E', '#16213E'],
      styleDescription:
          'Formal corporate style. Dark navy background with steel-blue panels. '
          'Conservative layout with structured data tables, crisp borders, '
          'and a highly professional boardroom-presentation look.',
    ),
  ];

  // ─── LAYOUT TEMPLATES ─────────────────────────────────────────────────────

  static const List<LayoutTemplate> layoutTemplates = [
    LayoutTemplate(
      id: 'data_dashboard',
      name: 'Data Dashboard',
      emoji: '📊',
      shortDescription:
          'Stats cards, progress bars, pie charts — ideal for analytics',
      requiredSections: [
        'Section 1: Title slide — big headline + subtitle + key metric badge',
        'Section 2: Executive summary — 4 large data cards (icon + big number + label)',
        'Section 3: Statistics panel — 4 compact cards in 2×2 grid',
        'Section 4: Progress analysis — 3-4 animated horizontal progress bars with %',
        'Section 5: Charts — CSS pie chart (left) + horizontal bar chart (right)',
        'Section 6: Trending data — metric grid with trend arrows (↑↓) and % change',
        'Section 7: Key insights — 3 compact bullet points with icon prefixes',
        'Section 8: Conclusion — simple summary with 2-3 key takeaways + footer',
      ],
      layoutDescription:
          'Data-first layout. Every section must contain real numbers, '
          'percentages, or statistics. Use charts and graphs heavily. '
          'The layout should feel like a live analytics dashboard.',
    ),
    LayoutTemplate(
      id: 'timeline_story',
      name: 'Timeline Story',
      emoji: '⏳',
      shortDescription:
          'Chronological milestones — ideal for history or journeys',
      requiredSections: [
        'Section 1: Title slide — headline + era/date range + one-line summary',
        'Section 2: Origins — background context with key founding facts',
        'Section 3: Timeline — 4-5 vertical timeline items with dates and descriptions',
        'Section 4: Key milestones — 4 milestone cards with year + event + impact',
        'Section 5: Data snapshot — stats from the era (3-4 compact data cards)',
        'Section 6: Turning point — before/after comparison showing change over time',
        'Section 7: Legacy & impact — bullet points on lasting significance',
        'Section 8: Conclusion — summary of the full journey + call to action',
      ],
      layoutDescription:
          'Chronological narrative layout. Emphasise dates, eras, and progression. '
          'Use vertical timeline elements with connecting lines and dot markers. '
          'Tell a story from beginning to present.',
    ),
    LayoutTemplate(
      id: 'before_after',
      name: 'Before & After',
      emoji: '⚔️',
      shortDescription: 'Side-by-side comparisons — ideal for case studies',
      requiredSections: [
        'Section 1: Title slide — topic name + problem statement',
        'Section 2: Executive overview — 4 cards summarising the comparison topic',
        'Section 3: Before state — red-themed card showing old situation with data',
        'Section 4: After state — green-themed card showing new situation with data',
        'Section 5: Side-by-side comparison table — multiple metrics in columns',
        'Section 6: Progress/improvement bars — showing % improvement per metric',
        'Section 7: Impact analysis — pie chart + key numbers of what changed',
        'Section 8: Conclusion — key takeaways and recommendation',
      ],
      layoutDescription:
          'Comparison-first layout. Every section must contrast two states. '
          'Use red (#FF6B6B tones) for "before/negative" blocks and '
          'green (#4CAF50 tones) for "after/positive" blocks. '
          'Data tables and comparison bars are mandatory.',
    ),
    LayoutTemplate(
      id: 'executive_brief',
      name: 'Executive Brief',
      emoji: '📋',
      shortDescription: 'Concise summary cards + bullets — ideal for pitches',
      requiredSections: [
        'Section 1: Title + one-sentence executive summary card',
        'Section 2: Problem statement — 2 large cards with bold text',
        'Section 3: Key findings — 4 data cards with critical numbers',
        'Section 4: Analysis — 3 progress bars representing priority/impact',
        'Section 5: Recommendations — numbered bullet list (3-5 items)',
        'Section 6: ROI or outcomes — before/after or metric cards',
        'Section 7: Action plan — compact 3-step card layout',
        'Section 8: Conclusion — summary + single call-to-action statement',
      ],
      layoutDescription:
          'Concise business-pitch layout. Keep text minimal and impactful. '
          'Each section must convey one clear idea. Use bold numbers and '
          'short declarative statements. Avoid long paragraphs.',
    ),
    LayoutTemplate(
      id: 'educational',
      name: 'Educational',
      emoji: '🎓',
      shortDescription: 'Definitions, examples, takeaways — ideal for learning',
      requiredSections: [
        'Section 1: Title + learning objective statement',
        'Section 2: Core concept definition — 2 large explanation cards',
        'Section 3: Key facts — 4 compact cards with important data points',
        'Section 4: How it works — numbered step flow (3-4 steps vertically)',
        'Section 5: Real-world examples — 3 example cards with icon + title + detail',
        'Section 6: Comparison — table or side-by-side of related concepts',
        'Section 7: Common misconceptions — bullet points debunking myths',
        'Section 8: Key takeaways — 3 clear learning points + further study',
      ],
      layoutDescription:
          'Educational explainer layout. Structured like a lesson. '
          'Start with definitions, build to examples, end with takeaways. '
          'Use numbered flows and clear visual hierarchy. '
          'Content must be factual, clear, and easy to follow.',
    ),
  ];

  // ─── DEFAULTS ─────────────────────────────────────────────────────────────

  static ColorTheme get defaultTheme => colorThemes.first;
  static LayoutTemplate get defaultLayout => layoutTemplates.first;
}
