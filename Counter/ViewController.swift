import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var counterPlusButton: UIButton!
    @IBOutlet weak var counterMinusButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    private var logger: Logger!
    
    private var counterValue = 0 {
        didSet {
            counter.text = "Значение счётчика: \(counterValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logTextView.isEditable = false
        
        self.logger = Logger(targetTextView: self.logTextView)
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        let (incremented, isOverflow) = counterValue.addingReportingOverflow(1)
        if !isOverflow {
            counterValue = incremented
            logger.log(.increment(val: 1))
        }
    }
    
    @IBAction func decrementCounter(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
            logger.log(.decrement(val: 1))
        } else {
            logger.log(.decrementBelowZero)
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        counterValue = 0
        logger.log(.reset)
    }
}

