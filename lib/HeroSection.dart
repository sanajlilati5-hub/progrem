import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final List<Map<String, String>> heroItems = const [
    {
      "title": "SMART WEARABLE",
      "subtitle": "Best Deals – Up to 60% OFF",
      "image": "assets/images/image2.png",
    },
    {
      "title": "NEW COLLECTION",
      "subtitle": "Trendy & Comfortable",
      "image": "assets/images/image2.png",
    },
    {
      "title": "ACCESSORIES",
      "subtitle": "Best Prices for You",
      "image": "assets/images/image2.png",
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToPrevious() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _goToNext() {
    if (_currentPage < heroItems.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: heroItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = heroItems[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF85A3), Color(0xff264c76)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          item["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(heroItems.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 10 : 6,
                  height: _currentPage == index ? 10 : 6,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.white : Colors.white54,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            left: 10,
            child: IconButton(
              onPressed: _goToPrevious,
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          Positioned(
            right: 10,
            child: IconButton(
              onPressed: _goToNext,
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
