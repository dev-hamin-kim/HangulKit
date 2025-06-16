import UIKit
import HangulKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(HangulKit.addJosa(after: "한글킷", within: .으로_로) ?? "")
    }
}
