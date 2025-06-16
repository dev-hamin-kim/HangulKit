import UIKit
import HangulKit

class ViewController: UIViewController {
        
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(SampleCell.self,
                           forCellReuseIdentifier: String(describing: SampleCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(HangulKit.addJosa(after: "한글킷", within: .으로_로) ?? "")
    }
}
