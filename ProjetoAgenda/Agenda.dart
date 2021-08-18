abstract class Contato {
  String _nome;
  String _telefone;
  String _data;

  Contato(this._nome, this._telefone, this._data);

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get telefone => _telefone;

  set telefone(String telefone) {
    _telefone = telefone;
  }

  String get data => _data;

  set data(String data) {
    _data = data;
  }
}

class ContatoProfissional extends Contato {
  String _empresa;
  String get empresa => _empresa;

  set empresa(String empresa) {
    _empresa = empresa;
  }

  ContatoProfissional(
      this._empresa, String _nome, String _telefone, String _data)
      : super(_nome, _telefone, _data);
  @override
  String toString() {
    return (' Empresa: $empresa,Nome: $nome, Telefone: $telefone, \nData: $data');
  }
}

class ContatoPessoal extends Contato {
  Endereco _endereco;

  Endereco get endereco => _endereco;
  

  set endereco(Endereco endereco) {
    _endereco = endereco;
  }

  ContatoPessoal(this._endereco, String _nome, String _telefone, String _data)
      : super(_nome, _telefone, _data);
  @override
  String toString() {
    return (' Endereço: $endereco,Nome: $nome, Telefone: $telefone, \nData: $data');
  }
}

class Endereco {
  String _rua;
  String _bairro;
  int _numero;

  String get rua => _rua;
  

  set rua(String rua) {
    _rua = rua;
  }

  String get bairro =>_bairro;
  

  set bairro(String bairro) {
    _bairro = bairro;
  }

  int get numero => _numero;
  

  set numero(int numero) {
    _numero = numero;
  }

  Endereco(this._rua, this._bairro, this._numero);
  @override
  String toString() {
    return 'Rua: $rua, Bairro: $bairro, N°: $numero ';
  }
}

class Agenda {
  var contatos = <Contato>[];

  void adicionar(Contato c) {
    contatos.add(c);
  }

  void remover(Contato c) {
    print("Remover contato:" + c.toString());
    contatos.remove(c);
  }

  bool pesquisar(Contato c) {
    print("Pesquisar contato: " + c.toString() + "\n");
    return contatos.contains(c);
  }

  void imprimirContatos() {
    print('\n Imprimindo Lista de Conatatos...');
    if (contatos.isEmpty) {
      print(' Nenhum contato adicionado');
    } else {
        for (var i = 0; i < contatos.length; i++) {
        Contato c = contatos[i];
        print("Contatos " + (i + 1).toString() + ':');
        print(c);
      }
    }
  }
}

void main() {
  var agenda = Agenda();

  var contato1 = new ContatoProfissional(
      "Grendene", "Messias", "8896513498", "03/05/2021");
  var contato2 = new ContatoPessoal(Endereco("Figueiedo", "Recreio", 136),
      "Barbara", "8894564512", "02/05/2021");
  var contato3 = new ContatoProfissional(
      "Magazine Luiza", "Debora", "8894567823", "07/08/2021");
  var contato4 = new ContatoPessoal(
      Endereco("Adalgisa ", "Recrio", 405), "Bia", "889734373", "04/05/2021");

  agenda.imprimirContatos();

  agenda.adicionar(contato1);
  agenda.adicionar(contato2);
  agenda.adicionar(contato3);
  agenda.adicionar(contato4);

  agenda.imprimirContatos();

  agenda.remover(contato2);

  agenda.imprimirContatos();
   

  var pesquisa = agenda.pesquisar(contato2);
  if (pesquisa) {
    print("Contato " + contato2.toString() + " Encontrado\n");
  } else {
    print("Contato " + contato2.toString() + " Não Encontrado\n");
  }

  pesquisa = agenda.pesquisar(contato1);
  if (pesquisa) {
    print("Contato " + contato1.nome + " Encontrado\n");
  } else {
    print("Contato " + contato1.nome + " Não Encontrado\n");
  }
}
