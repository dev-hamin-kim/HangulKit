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
