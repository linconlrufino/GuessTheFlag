//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Linconl Rufino on 18/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreboard: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestionsAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureCountries()
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        numberOfQuestionsAnswered += 1
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreboard.text = "Score: \(score)"
        }else {
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
            scoreboard.text = "Score: \(score)"
        }
        
        changeButtonColor()
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if numberOfQuestionsAnswered == 10 {
            ac.message =  "Your final score is \(score)"
        }
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
    func askQuestion (action: UIAlertAction! = nil) {
        
        if numberOfQuestionsAnswered == 10 {
            resetGame()
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func configureCountries() {
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco", "nigeria",
                      "poland", "russia", "spain", "uk", "us"]
    }
    
    func configureLayout() {
        
        button1.layer.borderWidth = 1
        button1.layer.cornerRadius = 12
        button1.layer.masksToBounds = true

        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 12
        button2.layer.masksToBounds = true
        
        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 12
        button3.layer.masksToBounds = true
        
        button1.layer.borderColor = UIColor.corDaBorda.cgColor
        button2.layer.borderColor = UIColor.corDaBorda.cgColor
        button3.layer.borderColor = UIColor.corDaBorda.cgColor
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor :UIColor.black]
        
        scoreboard.text = "Score: \(score)"
        scoreboard.layer.masksToBounds = true
        scoreboard.layer.cornerRadius = 12
        scoreboard.backgroundColor = UIColor.corDeFundoVerde
        
    }
    
    func changeButtonColor() {
        if score >= 0 {
            scoreboard.backgroundColor = UIColor.corDeFundoVerde
        } else {
            scoreboard.backgroundColor = UIColor.corDeFundoVermelho
        }
    }
    
    func resetGame() {
        score = 0
        numberOfQuestionsAnswered = 0
        scoreboard.text = "Score: \(score)"
    }
}
