import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class NewRequestMoney extends StatefulWidget {
  const NewRequestMoney({super.key});

  @override
  State<NewRequestMoney> createState() => _NewRequestMoneyState();
}

class _NewRequestMoneyState extends State<NewRequestMoney> {
  String? _selectedOption;
  final Color _colorPrimary = AppColors.primary;
  final List<Map<String, dynamic>> options = [
    {
      'value': 'efectivo',
      'label': 'Dinero en efectivo',
    },
    {
      'value': 'digital',
      'label': 'Dinero digital',
    },
    {
      'value': 'ambos',
      'label': 'Ambos (efectivo y digital)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Nueva Solicitud',
      withBottomNavigation: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _allWidgets(),
          ),
        ),
      ),
    );
  }

  List<Widget> _allWidgets() {
    return [
      _text(text: '¿Qué necesitas?'),
      SizedBox(height: 12),
      _selector(),
      SizedBox(height: 12),
      _text(text: '¿Cuánto?', fontSize: 14),
      SizedBox(height: 12),
      _input(placeholder: 'Ingresa el monto'),
      SizedBox(height: 12),
      _text(text: 'Ubicación', fontSize: 14),
      SizedBox(height: 12),
      _locationInput(),
      SizedBox(height: 12),
      _text(text: 'Nota (opcional)', fontSize: 14),
      SizedBox(height: 12),
      _input(placeholder: 'Agrega una nota', maxLines: 3),
      SizedBox(height: 20),
      _button(),
    ];
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorPrimary,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 56),
      ),
      child: Text(
        'Publicar solicitud',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _input({required String placeholder, int? maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green[300]!),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green[300]!),
        ),
        hintText: placeholder,
      ),
    );
  }

  Widget _selector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: _selectedOption,
        hint: Text('Selecciona una opción'),
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.green[700]),
        items: _selectorItems(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue;
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _selectorItems() {
    List<DropdownMenuItem<String>> widgets = [];

    for (var option in options) {
      widgets.add(
        DropdownMenuItem(
          value: option['value'],
          child: Text(option['label']),
        ),
      );
    }

    return widgets;
  }

  Widget _text({ required String text, double? fontSize = 16 }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _locationInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.red),
          SizedBox(width: 8),
          Text('Mi ubicación actual'),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {},
            child: Text('Cambiar', style: TextStyle(color: Colors.green[700]!)),
          ),
        ],
      ),
    );
  }
}

