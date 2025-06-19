import UIKit
import HangulKit

class ViewController: UIViewController {
    
    private let listOfNumbers = Array(-1...10)
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
        
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfNumbers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SampleCell.self),
                                                 for: indexPath) as! SampleCell
        
        let currentNumber = listOfNumbers[indexPath.row]
        let currentNumberAsKoreanDay = HangulKit.days(currentNumber)
        let koreanDayWithJosa = currentNumberAsKoreanDay?.hk.addJosa(within: .을_를)
        let choseong = koreanDayWithJosa?.hk.getChoseong() ?? "-"

        cell.setIndex(to: currentNumber)
        cell.setDay(to: koreanDayWithJosa ?? "지원하지 않는 숫자입니다.")
        cell.setChoseong(to: choseong)
        
        return cell
    }
}
