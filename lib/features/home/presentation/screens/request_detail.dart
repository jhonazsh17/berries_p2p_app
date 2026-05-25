import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_avatar.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';
import 'package:berries_p2p_app/shared/widgets/notification_banner.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/location.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/exchange_in_process.dart';

class RequestDetail extends StatelessWidget {
  final Color _colorPrimary = AppColors.primary;
  final Map<String, dynamic> requester;

  const RequestDetail({super.key, required this.requester});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Detalle de Solicitud',
      withBottomNavigation: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAvatar(radius: 50, imagePath: requester['image']),
              SizedBox(height: 20),
              Text(
                requester['person'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('${requester['stars']} (${requester['points']})'),
                ],
              ),
              SizedBox(height: 16),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monto', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Text('S/ ${requester['amount']}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quiere', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Text(requester['requestType'] == 'digital' ? 'Dinero digital' : 'Dinero en efectivo'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recibirás', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              showInformationDialog(context);
                            },
                            child: Icon(
                              Icons.info_outline, 
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(requester['requestType'] != 'digital' ? 'Dinero digital' : 'Dinero en efectivo'),
                        ],)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CustomCard(
                title: 'Ubicación',
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Location(requester: requester)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calle Martin Waiss 101 - Cercado Máncora (Referencia: Porton rojo)', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Text('A 500m de tí', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                    ), 
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: _colorPrimary, size: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              NotificationBanner(
                text: 'Recuerda: realiza el intercambio en un lugar público y verifica el pago antes de entregar el efectivo',
              ),
              SizedBox(height: 16),
              SizedBox(
              width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ExchangeInProcess()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _colorPrimary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Text('Conectar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Información'),
        content: Text('El Dinero digital hace referencia a que la persona solicitante cuenta con saldo en alguna de sus cuentas de banco o billeteras digitales para proceder con el intercambio.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
            ),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
