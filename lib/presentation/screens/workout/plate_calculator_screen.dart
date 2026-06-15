import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_typography.dart';

/// Plate calculator — full SVG barbell in Phase 8.
/// Phase 7 stub shows the plate list.
class PlateCalculatorScreen extends StatefulWidget {
  const PlateCalculatorScreen({super.key});

  @override
  State<PlateCalculatorScreen> createState() => _PlateCalculatorScreenState();
}

class _PlateCalculatorScreenState extends State<PlateCalculatorScreen> {
  final _controller = TextEditingController();
  String _unit = 'lbs';
  List<double> _plates = [];

  static const _barWeightLbs = 45.0;
  static const _availablePlates = [45.0, 35.0, 25.0, 10.0, 5.0, 2.5];

  void _calculate() {
    final target = double.tryParse(_controller.text);
    if (target == null || target <= _barWeightLbs) {
      setState(() => _plates = []);
      return;
    }
    var remaining = (target - _barWeightLbs) / 2;
    final plates = <double>[];
    for (final plate in _availablePlates) {
      while (remaining >= plate) {
        plates.add(plate);
        remaining -= plate;
      }
    }
    setState(() => _plates = plates);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plate Calculator',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9.]'))
                    ],
                    onChanged: (_) => _calculate(),
                    decoration: InputDecoration(
                      labelText: 'Target weight ($_unit)',
                    ),
                    style: AppTypography.stat.copyWith(
                        color: scheme.onSurface),
                  ),
                ),
                const SizedBox(width: 12),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'lbs', label: Text('lbs')),
                    ButtonSegment(value: 'kg', label: Text('kg')),
                  ],
                  selected: {_unit},
                  onSelectionChanged: (s) {
                    setState(() => _unit = s.first);
                    _calculate();
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_plates.isNotEmpty) ...[
              Text('PLATES PER SIDE',
                  style: AppTypography.sectionLabel
                      .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _plates
                    .map((p) => Chip(
                          label: Text(
                            '${p % 1 == 0 ? p.toStringAsFixed(0) : p} $_unit',
                            style: AppTypography.statSmall
                                .copyWith(color: scheme.onPrimary),
                          ),
                          backgroundColor: scheme.primary,
                        ))
                    .toList(),
              ),
            ] else
              Text(
                'Enter a target weight above the bar (${_unit == 'lbs' ? '45' : '20'} $_unit).',
                style: AppTypography.body.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.5)),
              ),
          ],
        ),
      ),
    );
  }
}
