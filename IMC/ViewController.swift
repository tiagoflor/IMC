//
//  ViewController.swift
//  IMC
//
//  Created by tiago.flor on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
//text fields peso e altura
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
 // Label e imagem Resultado
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResults: UIImageView!
//o Bloco maior do "seu indice de massa corporal é:"
    @IBOutlet weak  var viResult: UIView!
    @IBOutlet weak var calculate: UIButton!
    
    var imc: Double = 0 //variavel imc que começa com zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculate(_ sender: UIButton) {
        if let weight = Double(tfWeight.text!) , let height = Double (tfHeight.text!) {
            imc = weight / (height*height) // altura elevado ao quadrado (funcao pow)
            showResults()
        }    //extrai o texto e converte para double e o resultado fica no weight; !=optional ;
    
    }
    func showResults(){
        var result: String = "" //var result void
        var image: String = "" //var image void
        switch imc {
            case 0..<16:  // caso esteja entre 0 e 16
                    result = "Magresa"
                    image = "abaixo"
                case 16..<18.5:
                    result = "Abaixo do peso"
                    image = "abaixo"
                case 18.5..<25:
                    result = "Peso ideal"
                    image = "ideal"
                case 25..<30:
                    result = "Sobrepeso"
                    image = "sobre"
                default:
                    result = "Obesidade"
                    image = "obesidade"
        }
        lbResult.text = result // lbResult vai conter o mesmo texto que result
        ivResults.image = UIImage (named: image) // image view Result vai conter UIImage baseada image set
        viResult.isHidden = false //Minha vi result está escondida? false
        view.endEditing(true) //qualquer view finalizem sua edicao
    }
}

