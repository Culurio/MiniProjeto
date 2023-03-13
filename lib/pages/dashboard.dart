import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle('Average Difficulty - Next 7 Days'),
          _buildDifficultyBar(0.8), // Replace with actual difficulty value
          SizedBox(height: 20.0),
          _buildSectionTitle('Average Difficulty - Next 7-14 Days'),
          _buildDifficultyBar(0.4), // Replace with actual difficulty value
          SizedBox(height: 20.0),
          _buildSectionTitle('Evaluations'),
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
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildEvaluationItem('Math', 'A', '95%'),
        _buildEvaluationItem('Science', 'B', '85%'),
        _buildEvaluationItem('English', 'A-', '92%'),
      ],
    );
  }

  Widget _buildEvaluationItem(String subject, String grade, String score) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(subject[0]),
      ),
      title: Text(subject),
      subtitle: Text('Grade: $grade, Score: $score'),
    );
  }
}