//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalResultLabel: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    var chosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let resultAnimal = getResultAnimal(from: chosenAnswers)
        animalResultLabel.text = "Вы - \(resultAnimal.rawValue)"
        descriptionResultLabel.text = resultAnimal.definition
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods
private extension ResultViewController {
    
    func getResultAnimal(from answers: [Answer]) -> Animal {
        var animalsCount: [Animal: Int] = [.cat: 0, .dog: 0, .rabbit: 0, .turtle: 0]
        
        answers.forEach { answer in
            let startValue = animalsCount[answer.animal] ?? 0
            animalsCount[answer.animal] = startValue + 1
        }
        
        let sortedAnimalsCount = animalsCount.sorted { $0.1 > $1.1 }
        
        guard let winner = sortedAnimalsCount.first else { return .cat }
        return winner.key
    }
    
}
