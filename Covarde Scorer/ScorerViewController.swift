//
//  ScorerViewController.swift
//  Covarde Scorer
//
//  Created by Ben Hur Martins on 17/03/17.
//  Copyright © 2017 Ben Hur Martins. All rights reserved.
//

import UIKit

class ScorerViewController: UIViewController {
    
    var round : Int = 1
    
    var contadorVerde : Int = 0
    var contadorVermelho : Int = 0
    var contadorAmarelo : Int = 0
    var contadorPreto : Int = 0
    var contadorAzul : Int = 0
    
    var pontuacaoVerde : Decimal = 0
    var pontuacaoAzul : Decimal = 0
    var pontuacaoAmarelo : Decimal = 0
    var pontuacaoPreto : Decimal = 0
    var pontuacaoVermelho : Decimal = 0

    @IBOutlet weak var labelRound: UILabel!
    
    @IBOutlet weak var labelDragaoAzul: UILabel!
    
    @IBOutlet weak var labelDragaoVerde: UILabel!
    
    @IBOutlet weak var labelDragaoAmarelo: UILabel!
    
    @IBOutlet weak var labelDragaoPreto: UILabel!
    
    @IBOutlet weak var labelDragaoVermelho: UILabel!
    
    
    @IBOutlet weak var switchAzul: UISwitch!
    
    @IBOutlet weak var switchVerde : UISwitch!
    
    @IBOutlet weak var switchAmarelo: UISwitch!
    
    @IBOutlet weak var switchPreto: UISwitch!
    
    @IBOutlet weak var switchVermelho: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelRound.text = ("ROUND \(round)")
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDragaoAzul(_ sender: UIButton) {
        if contadorAzul == 10 {
            contadorAzul = 0
        }else{
            contadorAzul += 1
        }
        labelDragaoAzul.text = String(contadorAzul)
    }
    
    @IBAction func btnDragaoVerde(_ sender: UIButton) {
        if contadorVerde == 10 {
            contadorVerde = 0
        }else{
            contadorVerde += 1
        }
        labelDragaoVerde.text = String(contadorVerde)
    }
    
    @IBAction func btnDragaoAmarelo(_ sender: UIButton) {
        if contadorAmarelo == 10 {
            contadorAmarelo = 0
        }else{
            contadorAmarelo += 1
        }
        labelDragaoAmarelo.text = String(contadorAmarelo)
    }
    
    @IBAction func btnDragaoPreto(_ sender: UIButton) {
        if contadorPreto == 10 {
            contadorPreto = 0
        }else{
            contadorPreto += 1
        }
        labelDragaoPreto.text = String(contadorPreto)
    }
    
    @IBAction func btnDragaoVermelho(_ sender: UIButton) {
        if contadorVermelho == 10 {
            contadorVermelho = 0
        }else{
            contadorVermelho += 1
        }
        labelDragaoVermelho.text = String(contadorVermelho)
    }
    
    @IBAction func btnLutem(_ sender: UIButton) {
        
        
        self.resolvendoCovardes()
        self.resolvendoCorajosos()
        self.zerandoSwitchs()
        self.zerandoLabels()
        self.zerandoContadores()
        
        if round == 11 {
            labelRound.text = ("ROUND \(1)")
            round = 1
            self.zerandoPontuacao()
        }else{
            if round == 10 {
                labelDragaoAmarelo.text = String(describing: pontuacaoAmarelo)
                labelDragaoVerde.text = String(describing: pontuacaoVerde)
                labelDragaoAzul.text = String(describing: pontuacaoAzul)
                labelDragaoVermelho.text = String(describing: pontuacaoVermelho)
                labelDragaoPreto.text = String(describing: pontuacaoPreto)
                round += 1
                labelRound.text = ("ROUND \(round)")
            }else{
                round += 1
                labelRound.text = ("ROUND \(round)")
            }
        }
    }
    
    func resolvendoCorajosos(){
        
        //resolvendo quem acertou
        if (Int(labelDragaoAzul.text!)! > 0) && (switchAzul.isOn){
            pontuacaoAzul += Decimal((Int(labelDragaoAzul.text!)! + 10))
        }
        if (Int(labelDragaoAmarelo.text!)! > 0) && (switchAmarelo.isOn){
            pontuacaoAmarelo += Decimal((Int(labelDragaoAmarelo.text!)! + 10))
        }
        if (Int(labelDragaoVerde.text!)! > 0) && (switchVerde.isOn){
            pontuacaoVerde += Decimal((Int(labelDragaoVerde.text!)! + 10))
        }
        if (Int(labelDragaoVermelho.text!)! > 0) && (switchVermelho.isOn){
            pontuacaoVermelho += Decimal((Int(labelDragaoVermelho.text!)! + 10))
        }
        if (Int(labelDragaoPreto.text!)! > 0) && (switchPreto.isOn){
            pontuacaoPreto += Decimal((Int(labelDragaoPreto.text!)! + 10))
        }
        
        //resolvendo quem perdeu
        if (Int(labelDragaoAzul.text!)! > 0) && !(switchAzul.isOn){
            pontuacaoAzul -= Decimal((round + 10))
        }
        if (Int(labelDragaoAmarelo.text!)! > 0) && !(switchAmarelo.isOn){
            pontuacaoAmarelo -= Decimal((round + 10))
        }
        if (Int(labelDragaoVerde.text!)! > 0) && !(switchVerde.isOn){
            pontuacaoVerde -= Decimal((round + 10))
        }
        if (Int(labelDragaoVermelho.text!)! > 0) && !(switchVermelho.isOn){
            pontuacaoVermelho -= Decimal((round + 10))
        }
        if (Int(labelDragaoPreto.text!)! > 0) && !(switchPreto.isOn){
            pontuacaoPreto -= Decimal((round + 10))
        }
    }
    
    func resolvendoCovardes(){
        
        //resolvendo os covardes ganhadores
        if (Int(labelDragaoAzul.text!)! == 0) && (switchAzul.isOn){
            pontuacaoAzul += 10
        }
        if (Int(labelDragaoAmarelo.text!)! == 0) && (switchAmarelo.isOn){
            pontuacaoAmarelo += 10
        }
        if (Int(labelDragaoVerde.text!)! == 0) && (switchVerde.isOn){
            pontuacaoVerde += 10
        }
        if (Int(labelDragaoVermelho.text!)! == 0) && (switchVermelho.isOn){
            pontuacaoVermelho += 10
        }
        if (Int(labelDragaoPreto.text!)! == 0) && (switchPreto.isOn){
            pontuacaoPreto += 10
        }
        
        //resolvendo os covardes perdedores
        if (Int(labelDragaoAzul.text!)! == 0) && !(switchAzul.isOn){
            pontuacaoAzul -= Decimal((round + 10))
        }
        if (Int(labelDragaoAmarelo.text!)! == 0) && !(switchAmarelo.isOn){
            pontuacaoAmarelo -= Decimal((round + 10))
        }
        if (Int(labelDragaoVerde.text!)! == 0) && !(switchVerde.isOn){
            pontuacaoVerde -= Decimal((round + 10))
        }
        if (Int(labelDragaoVermelho.text!)! == 0) && !(switchVermelho.isOn){
            pontuacaoVermelho -= Decimal((round + 10))
        }
        if (Int(labelDragaoPreto.text!)! == 0) && !(switchPreto.isOn){
            pontuacaoPreto -= Decimal((round + 10))
        }
    }
    
    func zerandoSwitchs(){
        switchAmarelo.setOn(true, animated: true)
        switchVerde.setOn(true, animated: true)
        switchAzul.setOn(true, animated: true)
        switchVermelho.setOn(true, animated: true)
        switchPreto.setOn(true, animated: true)
    }
    
    func zerandoLabels(){
        labelDragaoAmarelo.text = "0"
        labelDragaoVerde.text = "0"
        labelDragaoAzul.text = "0"
        labelDragaoVermelho.text = "0"
        labelDragaoPreto.text = "0"
    }
    
    func zerandoContadores(){
        contadorVermelho = 0
        contadorAzul = 0
        contadorPreto = 0
        contadorVerde = 0
        contadorAmarelo = 0
    }
    
    func zerandoPontuacao(){
        pontuacaoAzul = 0
        pontuacaoPreto = 0
        pontuacaoVerde = 0
        pontuacaoAmarelo = 0
        pontuacaoVermelho = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
