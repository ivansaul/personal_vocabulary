import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class ProgressWidget extends StatelessWidget {
  final double progress;
  const ProgressWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTheme.progressTextStyle,
            children: const [
              TextSpan(
                text: 'Your Progress today: ',
              ),
              TextSpan(
                text: '51',
              ),
              TextSpan(
                text: '/200',
                style: TextStyle(
                  color: AppTheme.primaryColorGray,
                  fontSize: 10,
                ),
              ),
              TextSpan(
                text: ' words',
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 20,
          width: double.infinity,
          color: Colors.transparent,
          child: CustomPaint(
            painter: _ProgressPainter(progress: progress),
          ),
        ),
      ],
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;

  _ProgressPainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final pathIn = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.5);

    final paintIn = Paint()
      ..color = AppTheme.primaryColorWhite
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(pathIn, paintIn);

    final pathOut = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width * progress, size.height * 0.5);
    final paintOut = Paint()
      ..color = AppTheme.primaryColorBlack
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(pathOut, paintOut);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
