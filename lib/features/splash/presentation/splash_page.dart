import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final int totalPages = 3;

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login_page');
  }

  void _handleNextPage() {
    if (currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. CAROUSEL IMAGES BACKGROUND LAYER
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              buildPageLayout(
                "Welcome to\nmiliki ERP",
                "Sign in to start your corporate asset, inventory, and driver tracking operations smoothly.",
                "assets/images/chips",
              ),
              buildPageLayout(
                "Manage Fleet\n& Deliveries",
                "Assign motorcycle assets efficiently and view live data tracking streams on the go.",
                "assets/images/burger-king",
              ),
              buildPageLayout(
                "Realtime Ledger\n& Reports",
                "Generate custom transaction receipts and track payment processing securely instantly.",
                "assets/images/kfc",
              ),
            ],
          ),

          // 2. CORNER SKIP BUTTON (Anchored on Top Right, active on screen 1 & 2)
          if (currentPage != totalPages - 1)
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: _goToLogin,
                child: Text(
                  "Skip",
                  style: GoogleFonts.urbanist(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          // 3. RECENTRED TEXTS & BOTTOM BUTTON PANEL
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Realtime active worm indicator tracker
                SmoothWormIndicator(
                  controller: pageController,
                  count: totalPages,
                ),
                const SizedBox(height: 32),

                // Primary capsule button step operator
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _handleNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 124, 233, 162), // Your shining brand green
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Capsule style rounding edges
                      ),
                    ),
                    child: Text(
                      currentPage == totalPages - 1 ? "Get Started" : "Next",
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. CORE IMMERSIVE RENDERING SCHEME WITH REIFIED DEEP GRADIENT OVERLAY
  Widget buildPageLayout(String title, String subtitle, String imagePath) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          // Smooth vertical fade gradient overlay to dim the bottom third dark
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.2),  // Transparent up top to reveal driver picture
              Colors.black.withValues(alpha: 0.5),  // Mild blending mid screen
              Colors.black.withValues(alpha: 0.95), // Deep dark solid black overlay at base for texts
            ],
            stops: const [0.0, 0.4, 0.85],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Titles and captions pushed safely above your button cluster boundaries
              Text(
                title,
                style: GoogleFonts.urbanist(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                key: const ValueKey('sub-pad'),
                child: Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 180), // Creates safety spacing for indicators and button layers
            ],
          ),
        ),
      ),
    );
  }
}

class SmoothWormIndicator extends StatefulWidget {
  final PageController controller;
  final int count;

  const SmoothWormIndicator({
    required this.controller,
    required this.count,
    super.key,
  });

  @override
  State<SmoothWormIndicator> createState() => _SmoothWormIndicatorState();
}

class _SmoothWormIndicatorState extends State<SmoothWormIndicator> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    currentPage = widget.controller.initialPage;
    widget.controller.addListener(_handlePageChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handlePageChanged);
    super.dispose();
  }

  void _handlePageChanged() {
    final page = widget.controller.page;
    if (page == null) return;
    final nextPage = page.round();
    if (nextPage != currentPage) {
      setState(() {
        currentPage = nextPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.count, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white38,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
