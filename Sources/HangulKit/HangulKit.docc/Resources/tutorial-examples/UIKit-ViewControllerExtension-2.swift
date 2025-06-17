extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfNumbers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SampleCell.self),
                                                 for: indexPath) as! SampleCell
        let currentNumber = listOfNumbers[indexPath.row]
        
        cell.setIndex(to: currentNumber)
        
        return cell
    }
}
