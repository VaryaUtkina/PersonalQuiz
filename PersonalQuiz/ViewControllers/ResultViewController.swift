//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animal = getResult(from: answersChosen)
        animalLabel.text = "Вы - \(animal?.rawValue ?? "🐙")"
        descriptionLabel.text = animal?.definition ?? "Вы осьминог"
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResult(from answers: [Answer]) ->  Animal? {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        var answersCount: [Animal: Int] = [:]
        
        for answer in answers {
            switch answer.animal {
            case .dog: dogCount += 1
            case .cat: catCount += 1
            case .rabbit: rabbitCount += 1
            case .turtle: turtleCount += 1
            }
        }
        answersCount = [
            .dog: dogCount,
            .cat: catCount,
            .rabbit: rabbitCount,
            .turtle: turtleCount
        ]
        let sortedAnswersCount = answersCount.sorted { $0.value > $1.value }
        return sortedAnswersCount.first?.key
    }
}
