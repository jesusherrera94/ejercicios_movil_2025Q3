/*
 * Crea un juego de rol simple donde los jugadores puedan equiparse con diferentes tipos de armas. 
 * Implementa una clase abstracta Arma y varias clases concretas que hereden de ella 
 * (por ejemplo, Espada, Arco, Varita).
 *  Cada arma debe tener atributos como daño, rango y velocidad de ataque.
 *  La clase Player debe tener un atributo para almacenar el arma equipada y 
 *  métodos para atacar y cambiar de arma.
 * */

 // abstraccion
abstract class Weapon {
  int _damage = 0;
  int _range = 0;
  int _speed = 0;

  Weapon(this._damage, this._range, this._speed);

  void attack();

}

// herencia
class Sword extends Weapon {

  Sword(int damage, int range, int speed): super(damage, range, speed);

  @override
  void attack() {
    print('swosh!!!!!! 🤺🤺🤺🤺🤺🤺🤺');
  }

}

// herencia
class MachineGun extends Weapon {
  MachineGun(int damage, int range, int speed): super(damage, range, speed);

  @override
  void attack() {
    print('TRRRRRRRR!!!!! 🔫🔫🔫🔫🔫🔫🔫🔫');
  }
}

class Bomb extends Weapon {
  Bomb(int damage, int range, int speed): super(damage, range, speed);

  @override
  void attack() {
    print("Boom!!!! 💥💥💥💥💥💥💥💥");
  }
}




  class Player {

    // encapsulamiento
    String _playerName = '';
    int life = 0;

    // polimorfismo
    Weapon? _wp;

    // constructor por defecto
    Player(this._playerName, this.life);

    // constructores nombrados con parametros nombrados
    Player.playerWeapon({ required String playername, required int life, required Weapon wp}) {
      this._playerName = playername;
      this.life = life;
      this._wp = wp;
    }

    // getter
    String get playerName => _playerName;
    int get getLife => life;

    // metodos

    void attack() {
      if(_wp != null) {
        _wp!.attack();
      } else {
        // default attack!
        print("👊👊👊👊👊👊👊👊👊👊👊👊👊");
      }
    }

    void changeWeapon(Weapon newWeapon) {
      _wp = newWeapon;
    }

    void walk() {
      print('Walking!!!!! 🚶');
    }

  }

 void main() {
  print('======== Initialize =======');

  // instancia de un objeto
  Player player1 = Player("Hector", 100);
  print("Player1: ${player1.playerName}");
  player1.attack();
  player1.walk();

  print('============== Initialize player 2 ================');

  // definir dos armas
  Sword sw = Sword(2, 1, 15);
  MachineGun mg = MachineGun(100, 200, 1000);
  Bomb bm = Bomb(100, 350, 550);

  // definir el jugador 2 con el constructor nombrado

  Player player2 = Player.playerWeapon(playername: "Joseph", life: 100, wp: sw);
  print("Player1: ${player2.playerName}");

  player2.attack(); // debe de imprimir la espada!

  player2.changeWeapon(mg);

  player2.attack(); // debe de imprimir la metralleta!

  // crear nueva arma, ejecutar changeWeapon y attack posteriormente!.

  player2.changeWeapon(bm);

  player2.attack(); // debe de imprimir explosion!

 }
