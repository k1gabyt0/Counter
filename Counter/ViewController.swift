import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterPlusButton: UIButton!
    @IBOutlet private weak var counterMinusButton: UIButton!
    @IBOutlet private weak var logTextView: UITextView!
    
    private var logger: Logger?
    
    private var counterValue = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(counterValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logTextView.isEditable = false
        
        logger = Logger(targetTextView: logTextView)
    }
    
    @IBAction private func incrementCounterButtonTapped(_ sender: Any) {
        let (incremented, isOverflow) = counterValue.addingReportingOverflow(1)
        if !isOverflow {
            counterValue = incremented
            logger?.log(.increment(val: 1))
        }
    }
    
    @IBAction private func decrementCounterButtonTapped(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
            logger?.log(.decrement(val: 1))
        } else {
            logger?.log(.decrementBelowZero)
        }
    }
    
    @IBAction private func resetCounterButtonTapped(_ sender: Any) {
        counterValue = 0
        logger?.log(.reset)
    }
}

