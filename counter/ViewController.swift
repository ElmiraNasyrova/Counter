//
//  ViewController.swift
//  counter
//
//  Created by Эльмира Насырова on 22.07.2024.
//

import UIKit

final class ViewController: UIViewController {

//    UI Elements
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyView: UITextView!
    
//    Variables
    private var count: Int = .zero
    private var formattedDate: String {
        return "\(Date.now.formatted(date: .numeric, time: .standard)) UTC"
    }

//    первоначальные настройки
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: \(count)"
        counterLabel.textColor = .systemIndigo
        counterLabel.font = .boldSystemFont(ofSize: 20)
        historyView.text = "История изменений:"
        historyView.font = .boldSystemFont(ofSize: 26)
        historyView.textColor = .systemIndigo
        historyView.isFindInteractionEnabled = false
        plusButton.backgroundColor = .systemTeal
        plusButton.tintColor = .red
        minusButton.backgroundColor = .systemTeal
        minusButton.tintColor = .blue
    }
    
//    функция сброса счётчика
    @IBAction func resetCounter() {
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        historyView.text = "\(formattedDate): значение сброшено"
    }
    
//    функция, которая увеличивает счетчик по тапу на кнопку "+"
    @IBAction func plusCounter() {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        historyView.text = "\(formattedDate): значение изменено на +1"
    }
    
//   функция, которая уменьшает счетчик по тапу на кнопку "-"
    @IBAction func minusCounter() {
        count -= 1
        if count >= 0 {
            counterLabel.text = "Значение счетчика: \(count)"
            historyView.text = "\(formattedDate): значение изменено на -1"
        } else {
            count = 0
            counterLabel.text = "Значение счетчика: \(count)"
            historyView.text = "\(formattedDate): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    
}

