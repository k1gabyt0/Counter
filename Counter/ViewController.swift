import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var counterPlusButton: UIButton!
    
    private var counterValue: Int = 0 {
        didSet {
            counter.text = "Значение счётчика: \(counterValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        let (incremented, isOverflow) = counterValue.addingReportingOverflow(1)
        if !isOverflow {
            counterValue = incremented
        }
    }
}

