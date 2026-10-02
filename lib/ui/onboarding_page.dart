import 'package:flutter/material.dart';
import 'app_theme.dart';

class _OnboardingStep {
  final IconData icon;
  final String title;
  final String body;

  const _OnboardingStep(this.icon, this.title, this.body);
}

/// First-launch walkthrough. Calls [onFinished] when the user completes or skips it.
class OnboardingPage extends StatefulWidget {
  final VoidCallback onFinished;

  const OnboardingPage({super.key, required this.onFinished});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _page = 0;

  static const _steps = [
    _OnboardingStep(
      Icons.sensors_rounded,
      'Etiketi okut',
      'Alttaki mavi butona dokunun ve etiketi telefonun üst kısmına yaklaştırın. '
          'İçerik, kapasite ve seri numarası anında görünür.',
    ),
    _OnboardingStep(
      Icons.edit_note_rounded,
      'İstediğini yaz',
      '"Yaz" bölümünde "Kayıt Ekle"ye dokunun: web adresi, Wi-Fi, kartvizit, '
          'sosyal medya ve daha fazlası. Hazır şablonlarla saniyeler içinde hazırlayın.',
    ),
    _OnboardingStep(
      Icons.handyman_outlined,
      'Uzman araçlar',
      'Belleği okuyun, şifre koyun, etiketi kilitleyin veya biçimlendirin. '
          'Hepsi "Araçlar" bölümünde.',
    ),
    _OnboardingStep(
      Icons.collections_bookmark_outlined,
      'Etiketlerini düzenle',
      'Yazdığınız etiketlere isim, not ve fotoğraf ekleyip kütüphanenizde saklayın. '
          'Dili ve görünümü Ayarlar\'dan değiştirebilirsiniz.',
    ),
  ];

  bool get _isLast => _page == _steps.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_isLast) {
      widget.onFinished();
    } else {
      _pageController.nextPage(duration: const Duration(milliseconds: 320), curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.canvasGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8, top: 4),
                  child: TextButton(
                    onPressed: widget.onFinished,
                    style: TextButton.styleFrom(foregroundColor: AppColors.secondary),
                    child: const Text('Geç'),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _steps.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (_, i) => _buildStep(_steps[i]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _steps.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: i == _page ? 22 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: i == _page ? AppColors.accent : AppColors.border,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _next,
                    child: Text(_isLast ? 'Başla' : 'Devam'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(_OnboardingStep step) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 168,
            height: 168,
            decoration: BoxDecoration(
              gradient: AppColors.heroGradient,
              borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.3),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Icon(step.icon, size: 76, color: Colors.white),
          ),
          const SizedBox(height: 44),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.7),
          ),
          const SizedBox(height: 14),
          Text(
            step.body,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, height: 1.5, color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
