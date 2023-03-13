import 'package:intl/intl.dart';

import 'avalicao.dart';

class Lista_Avalicao {
   final List<Avaliacao> _avaliacaoLista = <Avaliacao>[];

  void adicionar (Avaliacao avaliacao){
    _avaliacaoLista.add(avaliacao);
  }

   String remover (int index, Avaliacao avaliacao){
    DateTime data = DateFormat('dd-MM-yyyy HH:mm').parse(avaliacao.data);
     if(data.isBefore(DateTime.now())){
       return "Só podem ser eliminadas registos de avaliações futuras.";
     }else{
       _avaliacaoLista.removeAt(index);
       return "O registo de avaliação selecionado foi apagado com sucesso.";
     }
   }

   Avaliacao getItem(int index){
      return _avaliacaoLista[index];
   }

   List<Avaliacao> getLista(){
      return _avaliacaoLista;
   }

   void ordenarData() {
     _avaliacaoLista.sort((a, b){ //sorting in ascending order
       return DateFormat('dd-MM-yyyy HH:mm').parse(a.data).compareTo(DateFormat('dd-MM-yyyy HH:mm').parse(b.data));
     });
   }

   void ordenarDataReverse() {
     _avaliacaoLista.sort((b, a){ //sorting in ascending order
       return DateFormat('dd-MM-yyyy HH:mm').parse(b.data).compareTo(DateFormat('dd-MM-yyyy HH:mm').parse(a.data));
     });
   }




}