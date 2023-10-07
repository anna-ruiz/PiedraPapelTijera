//
//  ViewController.swift
//  PiedraPapelTijera
//
//  Created by Anna on 07/10/2023.
//

import UIKit
import Toast

class ViewController: UIViewController {

    @IBOutlet weak var imagenMaquina: UIImageView!
    @IBOutlet weak var lbContadorUser: UILabel!
    @IBOutlet weak var lbContadorMaquina: UILabel!
    var contadorUser: UInt!
    var contadorMaquina: UInt!
    var tiradaJugador: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contadorUser = 0
        contadorMaquina = 0
        tiradaJugador = "";
    }

    @IBAction func pulsarPapel(_ sender: Any) {
        tiradaJugador = "PAPEL"
        
        comprobarGanador()
    }
    
    @IBAction func pulsarPiedra(_ sender: Any) {
        tiradaJugador = "PIEDRA"
        comprobarGanador()
        
    }
    
    @IBAction func pulsarTijera(_ sender: Any) {
        tiradaJugador = "TIJERA"
        comprobarGanador()
        
        
    }
    
    
    fileprivate func generarMaquina() -> String {
        let numAleatorio: UInt = UInt(Int.random(in: 1..<4))
        var tiradaMaquina: String
        
        switch numAleatorio {
        case 1:
            tiradaMaquina = "PAPEL"
            imagenMaquina.image = UIImage(named: "papel.jpg")
        case 2:
            tiradaMaquina = "PIEDRA"
            imagenMaquina.image = UIImage(named: "piedra.png")
        case 3:
            tiradaMaquina = "TIJERA"
            imagenMaquina.image = UIImage(named: "tijera.jpg")
        default:
            tiradaMaquina = "PAPEL"
        }
        
        return tiradaMaquina
    }
    
    func comprobarGanador(){
        let maquina: String = generarMaquina()
        
        if (maquina.isEmpty || tiradaJugador.isEmpty) {
            self.view.makeToast("Error en la tirada", duration: 5, position: .top)
        }else{
            if maquina == tiradaJugador{
                self.view.makeToast("Empate",duration: 1, position: .top)
            }else if (maquina == "TIJERA" && tiradaJugador == "PAPEL") || (maquina == "PIEDRA" && tiradaJugador == "TIJERA") ||
                        (maquina == "PAPEL" && tiradaJugador == "PIEDRA")
            {
                self.view.makeToast("Has perdido :(")
                contadorMaquina += 1
            } else if (tiradaJugador == "PIEDRA" && maquina == "TIJERA") ||
            (tiradaJugador == "TIJERA" && maquina == "PAPEL") ||
                        (tiradaJugador == "PAPEL" && maquina == "PIEDRA" ){
                self.view.makeToast("Has ganado!!!", duration: 2, position: .top)
                contadorUser += 1
                
            }
        }
        
        lbContadorUser.text = String(contadorUser)
        lbContadorMaquina.text = String(contadorMaquina)
    }
}

