import UIKit

class SampleCell: UITableViewCell {
    private let indexLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let choseongLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [indexLabel, dayLabel, choseongLabel].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            indexLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            indexLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            indexLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            dayLabel.leadingAnchor.constraint(equalTo: indexLabel.trailingAnchor, constant: 16),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            choseongLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            choseongLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            choseongLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndex(to number: Int) {
        indexLabel.text = "\(number)"
    }
    
    func setDay(to string: String) {
        dayLabel.text = string
    }
    
    func setChoseong(to string: String) {
        choseongLabel.text = string
    }
}
