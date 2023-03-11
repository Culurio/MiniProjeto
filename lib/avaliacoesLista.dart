import 'avalicao.dart';

class Lista_Avalicao {
   final List<Avaliacao> _avaliacaoLista = <Avaliacao>[];

  void adicionar (Avaliacao avaliacao){
    _avaliacaoLista.add(avaliacao);
  }

   void remover (int index){
     _avaliacaoLista.removeAt(index);
   }

   Avaliacao getItem(int index){
      return _avaliacaoLista[index];
   }

   List<Avaliacao> getLista(){
      return _avaliacaoLista;
   }


}