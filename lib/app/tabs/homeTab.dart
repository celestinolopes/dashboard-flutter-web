import 'package:flutter/material.dart';
import 'package:flutter_2/app/components/dashboardCard.dart';
import 'package:flutter_2/app/pages/home_page/home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Version 1.0",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dashboardcard(
                icon: Icons.people,
                color: Colors.yellow[700],
                label: "PRODUCTS",
                value: 30,
              ),
              Dashboardcard(
                icon: Icons.credit_card,
                color: Colors.blue,
                label: "DOCUMENTS",
                value: 343,
              ),
              Dashboardcard(
                icon: Icons.bar_chart,
                color: Colors.green,
                label: "USERS",
                value: 343,
              ),
              Dashboardcard(
                icon: Icons.bar_chart,
                color: Colors.red[800],
                label: "NOTIFICATIONS",
                value: 343,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("ESTATÍSTICAS DE USUÁRIOS"),
          ),
          Container(
              child: SfCartesianChart(
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    // Bind data source
                    dataSource: <SalesData>[
                      SalesData('Jan', 35),
                      SalesData('Feb', 208),
                      SalesData('Mar', 34),
                      SalesData('Apr', 320),
                      SalesData('May', 410)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales)
              ]))
        ],
      ),
    );
  }
}
