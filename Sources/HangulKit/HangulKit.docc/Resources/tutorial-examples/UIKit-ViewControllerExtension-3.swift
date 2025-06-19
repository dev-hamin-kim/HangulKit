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

        cell.setIndex(to: currentNumber)
        cell.setDay(to: currentNumberAsKoreanDay ?? "지원하지 않는 숫자입니다.")
        
        return cell
    }
}
