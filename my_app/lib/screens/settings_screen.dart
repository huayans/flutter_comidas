import 'package:flutter/material.dart';

import 'package:my_app/components/main_drawer.dart';
import 'package:my_app/models/settings.dart';

class SttingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SttingsScreen(this.onSettingsChanged, this.settings, {super.key});

  @override
  State<SttingsScreen> createState() => _SttingsScreenState();
}

class _SttingsScreenState extends State<SttingsScreen> {
  late Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwith(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwith(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwith(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwith(
                  'Vegana',
                  'Só exibe refeições vegana',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwith(
                  'Vegetariano',
                  'Só exibe refeições Vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
