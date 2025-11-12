import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bethany Granger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6B4FA0),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),
            const HeroSection(),
            const AboutMeSection(),
            const ProjectsSection(),
            const CustomerExperienceSection(),
            const CommunicationsSection(),
            const AndMoreSection(),
            const ContactSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Icon(
                Icons.double_arrow_rounded,
                color: const Color(0xFF6B4FA0),
                size: isMobile ? 32 : 40,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BETHANY',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'GRANGER',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Navigation
          if (!isMobile)
            Row(
              children: [
                _NavLink(
                  text: 'Home',
                  isActive: true,
                  onTap: () {},
                ),
                const SizedBox(width: 40),
                _NavLink(
                  text: 'About Me',
                  onTap: () {},
                ),
                const SizedBox(width: 40),
                _NavLink(
                  text: 'Projects',
                  onTap: () {},
                ),
                const SizedBox(width: 40),
                _NavLink(
                  text: 'Capabilities',
                  onTap: () {},
                ),
                const SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.code, color: Colors.grey[600]),
                  onPressed: () => _launchURL('https://github.com'),
                ),
                IconButton(
                  icon: Icon(Icons.work_outline, color: Colors.grey[600]),
                  onPressed: () => _launchURL('https://linkedin.com'),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.text,
    this.isActive = false,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: widget.isActive
                ? const Color(0xFF6B4FA0)
                : _isHovered
                    ? const Color(0xFF6B4FA0)
                    : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4A2C6D),
            Color(0xFF6B4FA0),
            Color(0xFF8B6BB7),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroContent(isMobile: isMobile),
                const SizedBox(height: 40),
                _HeroIllustration(isMobile: isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: _HeroContent(isMobile: isMobile),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 4,
                  child: _HeroIllustration(isMobile: isMobile),
                ),
              ],
            ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;

  const _HeroContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Complex ideas made simple',
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Hi! I'm Bethany a strategic and technically fluent professional with 8+ years of experience across customer experience (CX), software development, and communications in large, regulated organisations.",
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Learn More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroIllustration extends StatelessWidget {
  final bool isMobile;

  const _HeroIllustration({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 300 : 400,
          maxHeight: isMobile ? 300 : 400,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Placeholder for illustration
            Icon(
              Icons.person_outline,
              size: isMobile ? 200 : 280,
              color: Colors.white.withOpacity(0.3),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.lightbulb_outline,
                size: 40,
                color: Colors.amber[400],
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Icon(
                Icons.show_chart,
                size: 40,
                color: Colors.amber[400],
              ),
            ),
            Positioned(
              bottom: 40,
              right: 30,
              child: Icon(
                Icons.computer,
                size: 40,
                color: Colors.amber[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _AboutCard(
                      title: 'Complex Ideas Made Simple',
                      description:
                          'One of my key strengths is my ability to transform complex concepts into digestible, engaging presentations. With a knack for simplifying intricate ideas, I break them down into bite-sized, understandable chunks that captivate and inform your audience.',
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _AboutCard(
                      title: 'Passion for Growth and Learning',
                      description:
                          "I'm a perpetual learner who thrives on challenges. I believe that growth is a never-ending journey, and I continuously seek opportunities to expand my horizons and stay ahead of industry trends. This passion for learning is woven into every project I undertake, ensuring you receive the most up-to-date, innovative solutions.",
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _AboutCard(
                      title: 'Data with a Twist',
                      description:
                          "Data doesn't have to be dry and boring. I specialize in making data interesting and relatable through the art of data storytelling. I bring numbers to life, turning them into compelling narratives that drive decisions and inspire action.",
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _AboutCard(
                      title: 'A Creative Problem Solver',
                      description:
                          'My broad range of experiences equips me with a diverse perspective that often reveals insights others may overlook. I approach problems with creativity and originality, always striving to find solutions that make a real difference.',
                      isMobile: isMobile,
                    ),
                  ],
                )
              : Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 200) / 2,
                      child: _AboutCard(
                        title: 'Complex Ideas Made Simple',
                        description:
                            'One of my key strengths is my ability to transform complex concepts into digestible, engaging presentations. With a knack for simplifying intricate ideas, I break them down into bite-sized, understandable chunks that captivate and inform your audience.',
                        isMobile: isMobile,
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 200) / 2,
                      child: _AboutCard(
                        title: 'Passion for Growth and Learning',
                        description:
                            "I'm a perpetual learner who thrives on challenges. I believe that growth is a never-ending journey, and I continuously seek opportunities to expand my horizons and stay ahead of industry trends. This passion for learning is woven into every project I undertake, ensuring you receive the most up-to-date, innovative solutions.",
                        isMobile: isMobile,
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 200) / 2,
                      child: _AboutCard(
                        title: 'Data with a Twist',
                        description:
                            "Data doesn't have to be dry and boring. I specialize in making data interesting and relatable through the art of data storytelling. I bring numbers to life, turning them into compelling narratives that drive decisions and inspire action.",
                        isMobile: isMobile,
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 200) / 2,
                      child: _AboutCard(
                        title: 'A Creative Problem Solver',
                        description:
                            'My broad range of experiences equips me with a diverse perspective that often reveals insights others may overlook. I approach problems with creativity and originality, always striving to find solutions that make a real difference.',
                        isMobile: isMobile,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isMobile;

  const _AboutCard({
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _ProjectImage(isMobile: isMobile),
                    const SizedBox(height: 40),
                    _ProjectContent(isMobile: isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: _ProjectImage(isMobile: isMobile),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 5,
                      child: _ProjectContent(isMobile: isMobile),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final bool isMobile;

  const _ProjectImage({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.location_city,
              size: isMobile ? 60 : 80,
              color: Colors.grey[600],
            ),
            const Positioned(
              bottom: 80,
              child: Icon(
                Icons.play_circle_outline,
                size: 60,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  final bool isMobile;

  const _ProjectContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Melbourne Unlocked',
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Lovingly curated content and beautiful photos about the lost history and secrets of Melbourne available for you on the go & in the moment. Melbourne Unlocked is an exciting new application that turns learning and discovering new locations into a game.',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: Colors.black87,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        _ProjectLink(
          text: 'Available at www.unlocked.melbourne',
          subtext: '*Was previously available on the Google Play Store',
          onTap: () {},
        ),
        const SizedBox(height: 16),
        _ProjectLink(
          text: 'Original LoFi Wireframe',
          onTap: () {},
        ),
      ],
    );
  }
}

class _ProjectLink extends StatelessWidget {
  final String text;
  final String? subtext;
  final VoidCallback onTap;

  const _ProjectLink({
    required this.text,
    this.subtext,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF6B4FA0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (subtext != null) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 44),
            child: Text(
              subtext!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class CustomerExperienceSection extends StatelessWidget {
  const CustomerExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'Customer Experience Solutions',
            style: TextStyle(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Customer lead, data driven, creative consulting.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _ServiceCard(
                      icon: Icons.circle,
                      title: 'Research',
                      items: [
                        'Identify pain points and opportunities from customer feedback.',
                        'Uncover underutilised data sources',
                        'Build cross functional analysis',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.check,
                      title: 'Strategy',
                      items: [
                        'Develop baseline Customer Journey Map & key reporting metrics',
                        'Direct focus to the key priorities and most lucrative opportunities.',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.square,
                      title: 'Design',
                      items: [
                        'Create future state Customer Journey Map',
                        'Develop Voice of Customer (VOC) research program',
                        'Maintain Customer Journey map as uplifts\' are executed and you move close to target state.',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.architecture,
                      title: 'Delivery',
                      items: [
                        'Work with your team to deliver customer lead initiatives.',
                        'Measure effectiveness of uplift activities through CX metrics & reporting.',
                      ],
                      isMobile: isMobile,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.circle,
                        title: 'Research',
                        items: [
                          'Identify pain points and opportunities from customer feedback.',
                          'Uncover underutilised data sources',
                          'Build cross functional analysis',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.check,
                        title: 'Strategy',
                        items: [
                          'Develop baseline Customer Journey Map & key reporting metrics',
                          'Direct focus to the key priorities and most lucrative opportunities.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.square,
                        title: 'Design',
                        items: [
                          'Create future state Customer Journey Map',
                          'Develop Voice of Customer (VOC) research program',
                          'Maintain Customer Journey map as uplifts\' are executed and you move close to target state.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.architecture,
                        title: 'Delivery',
                        items: [
                          'Work with your team to deliver customer lead initiatives.',
                          'Measure effectiveness of uplift activities through CX metrics & reporting.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final bool isMobile;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.items,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: isMobile ? 60 : 80,
          color: const Color(0xFF6B4FA0),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: isMobile ? 13 : 15,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            )),
      ],
    );
  }
}

class CommunicationsSection extends StatelessWidget {
  const CommunicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'Communications & Knowledge Management',
            style: TextStyle(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Design backed, strategically executed, clean communications.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _ServiceCard(
                      icon: Icons.layers,
                      title: 'Research',
                      items: [
                        'Develop baseline metrics for effectiveness of KMS and communications.',
                        'Identify pain points from internal & external feedback',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.dashboard,
                      title: 'Strategy',
                      items: [
                        'Close the loop, deliver communications through the right channels.',
                        'Determine which content needs to be highlighted and / or uplifted.',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.view_week,
                      title: 'Design',
                      items: [
                        'Transform complex ideas into simple and powerful communications.',
                        'Develop engaging Knowledge management systems and content.',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 20),
                    _ServiceCard(
                      icon: Icons.people,
                      title: 'Delivery',
                      items: [
                        'Work with your team to deliver communications.',
                        'Measure effectiveness of communications through metrics and reporting.',
                      ],
                      isMobile: isMobile,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.layers,
                        title: 'Research',
                        items: [
                          'Develop baseline metrics for effectiveness of KMS and communications.',
                          'Identify pain points from internal & external feedback',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.dashboard,
                        title: 'Strategy',
                        items: [
                          'Close the loop, deliver communications through the right channels.',
                          'Determine which content needs to be highlighted and / or uplifted.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.view_week,
                        title: 'Design',
                        items: [
                          'Transform complex ideas into simple and powerful communications.',
                          'Develop engaging Knowledge management systems and content.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _ServiceCard(
                        icon: Icons.people,
                        title: 'Delivery',
                        items: [
                          'Work with your team to deliver communications.',
                          'Measure effectiveness of communications through metrics and reporting.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class AndMoreSection extends StatelessWidget {
  const AndMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'And More...',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _SkillCard(
                      icon: Icons.palette,
                      title: 'Graphic Design',
                      items: [
                        'Delight with creative, clean, and consistent visuals.',
                        'Evoke emotion through imagery.',
                        'Transform reporting and analytics into stories, though design.',
                      ],
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 40),
                    _SkillCard(
                      icon: Icons.code,
                      title: 'Full Stack Development',
                      items: [
                        'Make using your digital interfaces effortless.',
                        'UX recommendations backed by robust technical understanding.',
                        'End-to-end solution execution available.',
                      ],
                      isMobile: isMobile,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: _SkillCard(
                        icon: Icons.palette,
                        title: 'Graphic Design',
                        items: [
                          'Delight with creative, clean, and consistent visuals.',
                          'Evoke emotion through imagery.',
                          'Transform reporting and analytics into stories, though design.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: _SkillCard(
                        icon: Icons.code,
                        title: 'Full Stack Development',
                        items: [
                          'Make using your digital interfaces effortless.',
                          'UX recommendations backed by robust technical understanding.',
                          'End-to-end solution execution available.',
                        ],
                        isMobile: isMobile,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final bool isMobile;

  const _SkillCard({
    required this.icon,
    required this.title,
    required this.items,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: isMobile ? 60 : 80,
          color: const Color(0xFF6B4FA0),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            )),
      ],
    );
  }
}

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactInfo(isMobile: isMobile),
                const SizedBox(height: 40),
                _ContactForm(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  messageController: _messageController,
                  isMobile: isMobile,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: _ContactInfo(isMobile: isMobile),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 5,
                  child: _ContactForm(
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    emailController: _emailController,
                    messageController: _messageController,
                    isMobile: isMobile,
                  ),
                ),
              ],
            ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final bool isMobile;

  const _ContactInfo({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6B4FA0),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Let\'s Work Together',
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Melbourne',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.code, color: Colors.grey[600]),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.work_outline, color: Colors.grey[600]),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final bool isMobile;

  const _ContactForm({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.messageController,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        isMobile
            ? Column(
                children: [
                  _FormField(
                    controller: firstNameController,
                    label: 'First Name',
                  ),
                  const SizedBox(height: 20),
                  _FormField(
                    controller: lastNameController,
                    label: 'Last Name',
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: _FormField(
                      controller: firstNameController,
                      label: 'First Name',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _FormField(
                      controller: lastNameController,
                      label: 'Last Name',
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 20),
        _FormField(
          controller: emailController,
          label: 'Email *',
        ),
        const SizedBox(height: 20),
        _FormField(
          controller: messageController,
          label: 'Leave me a message...',
          maxLines: 5,
        ),
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6B4FA0),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;

  const _FormField({
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6B4FA0), width: 2),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          '© 2023 by Bethany Granger',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
