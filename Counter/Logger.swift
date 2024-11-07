import UIKit

enum CounterLogEvent {
    case increment(val: Int)
    case decrement(val: Int)
    case decrementBelowZero
    case reset
    
    func text() -> String {
        switch self {
        case .increment(val: let val):
            "значение изменено на +\(val)"
        case .decrement(val: let val):
            "значение изменено на -\(val)"
        case .decrementBelowZero:
            "попытка уменьшить значение счётчика ниже 0"
        case .reset:
            "значение сброшено"
        }
    }
}

struct Logger {
    private var targetTextView: UITextView
    private let dateFormatter: DateFormatter
    
    init(targetTextView: UITextView) {
        self.targetTextView = targetTextView
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "HH:mm:ss"
    }
    
    func log(_ event: CounterLogEvent) {
        let now = dateFormatter.string(from: Date())
        let text = "[\(now)] \(event.text())"
        targetTextView.text.append("\n\(text)")
        
        let lastLine = NSRange(location: targetTextView.text.count - 1, length: 1)
        targetTextView.scrollRangeToVisible(lastLine)
    }
}
