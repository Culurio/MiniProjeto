import 'package:flutter/material.dart';
import 'package:mini_projeto/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle('Dificuldade Média - nos próximos 7 dias'),
          _buildDifficultyBar(0.8), // Replace with actual difficulty value
          SizedBox(height: 20.0),
          _buildSectionTitle('Dificuldade Média - nos próximos 7-14 dias'),
          _buildDifficultyBar(0.4), // Replace with actual difficulty value
          SizedBox(height: 20.0),
          _buildSectionTitle('Avaliações nos próximos 7 dias'),
          _buildEvaluationList(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.grey[200],
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildDifficultyBar(double difficulty) {
    return Container(
      height: 20.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FractionallySizedBox(
        widthFactor: difficulty,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildEvaluationList() {
    return Expanded(
      child: ListView.builder(
        itemCount: avaliacaoLista.getLista().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(avaliacaoLista.getLista()[index].disciplina_nome),
            subtitle: Text('Difficulty: ${avaliacaoLista.getLista()[index].nivel}'),
            trailing: Text('Date: ${avaliacaoLista.getLista()[index].data}'),
          );
        },
      ),
    );
  }

}