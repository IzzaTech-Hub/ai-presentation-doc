import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/template_model.dart';
import '../../../data/templates/presentation_templates.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background with wave-like shape
          Positioned.fill(
            child: CustomPaint(painter: _WavePainter(), child: Container()),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    // App Title
                    const Center(
                      child: Text(
                        'Imagine X',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    const Center(
                      child: Text(
                        'Visualize your ideas in seconds',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Prompt Input Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Obx(
                        () => TextField(
                          controller: controller.promptController,
                          enabled: !controller.isLoading.value,
                          decoration: InputDecoration(
                            hintText: 'What you want to visualize...',
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                            suffixIcon: Obx(
                              () => GestureDetector(
                                onTap: controller.isLoading.value
                                    ? null
                                    : () {
                                        controller.generateInfographic();
                                      },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C3E50),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                          ),
                                        )
                                      : const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          onChanged: (value) => controller.clearError(),
                          onSubmitted: (value) =>
                              controller.generateInfographic(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Color Theme Picker ──────────────────────────────────
                    _SectionLabel(
                      label: 'Choose Theme',
                      icon: Icons.palette_outlined,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemCount: PresentationTemplates.colorThemes.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final theme =
                              PresentationTemplates.colorThemes[index];
                          return Obx(
                            () => _ThemeCard(
                              theme: theme,
                              isSelected:
                                  controller.selectedTheme.value.id == theme.id,
                              isDisabled: controller.isLoading.value,
                              onTap: () => controller.selectTheme(theme),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ── Layout Template Picker ──────────────────────────────
                    _SectionLabel(
                      label: 'Choose Layout',
                      icon: Icons.view_quilt_outlined,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 116,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemCount: PresentationTemplates.layoutTemplates.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final layout =
                              PresentationTemplates.layoutTemplates[index];
                          return Obx(
                            () => _LayoutCard(
                              layout: layout,
                              isSelected:
                                  controller.selectedLayout.value.id ==
                                  layout.id,
                              isDisabled: controller.isLoading.value,
                              onTap: () => controller.selectLayout(layout),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Example Topics
                    const Text(
                      'Example Topics:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Tags Grid
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildTag('5G Technology'),
                        _buildTag('Dog Breeds'),
                        _buildTag('Public Issues'),
                        _buildTag('Learning Plans'),
                        _buildTag('Office Culture'),
                        _buildTag('Fan Pages'),
                        _buildTag('Freelance Work'),
                        _buildTag('Objectives'),
                        _buildTag('Furniture'),
                        _buildTag('Climate Change'),
                        _buildTag('AI Trends'),
                      ],
                    ),

                    // Footer
                    if (!isKeyboardVisible) ...[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      const Column(
                        children: [
                          Text(
                            'Innovation starts where imagination ends.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'AI that sees beyond limits ✨',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ] else
                      const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Error Message
          Obx(
            () => controller.errorMessage.value.isNotEmpty
                ? Positioned(
                    top: 100,
                    left: 24,
                    right: 24,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red[600],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              controller.errorMessage.value,
                              style: TextStyle(color: Colors.red[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Obx(
      () => GestureDetector(
        onTap: controller.isLoading.value
            ? null
            : () {
                controller.promptController.text = text;
              },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: controller.isLoading.value
                  ? const Color(0xFF2D3748).withValues(alpha: 0.5)
                  : const Color(0xFF2D3748),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Section Label ─────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SectionLabel({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ── Color Theme Card ──────────────────────────────────────────────────────────

class _ThemeCard extends StatelessWidget {
  final ColorTheme theme;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.theme,
    required this.isSelected,
    required this.isDisabled,
    required this.onTap,
  });

  Color _hex(String hex) {
    final h = hex.replaceAll('#', '');
    return Color(int.parse('FF$h', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _hex(theme.gradientColors[0]),
              _hex(theme.gradientColors[1]),
            ],
          ),
          border: isSelected
              ? Border.all(color: Colors.white, width: 2.5)
              : Border.all(color: Colors.transparent, width: 2.5),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(theme.emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 5),
            Text(
              theme.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(Icons.check_circle, color: Colors.white, size: 14),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Layout Template Card ──────────────────────────────────────────────────────

class _LayoutCard extends StatelessWidget {
  final LayoutTemplate layout;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const _LayoutCard({
    required this.layout,
    required this.isSelected,
    required this.isDisabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 130,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: Colors.white, width: 2)
              : Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(layout.emoji, style: const TextStyle(fontSize: 20)),
                if (isSelected) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF2C3E50),
                    size: 14,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 3),
            Text(
              layout.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? const Color(0xFF2D3748) : Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 1),
            Text(
              layout.shortDescription,
              style: TextStyle(
                fontSize: 9,
                color: isSelected ? const Color(0xFF718096) : Colors.white70,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Background Wave Painter ───────────────────────────────────────────────────

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.2,
      size.width * 0.4,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.4,
      size.width * 0.8,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.2,
      size.width,
      size.height,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
