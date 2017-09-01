//: Please build the scheme 'SnapKitPlayground' first
import Foundation
import UIKit
import PlaygroundSupport
import SnapKit

PlaygroundPage.current.needsIndefiniteExecution = true

class CustomCell:UITableViewCell {
    static let reuseID = "CustomCellREUSEID"
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var buttonLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .blue
        label.text = "Button"
        label.textColor = .white
        self.contentView.addSubview(label)
        return label
    }()
    
    public func configure(with text:String) {
        label.text = text
        label.backgroundColor = .white
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        //what to do with the constraints?
        
        label.snp.updateConstraints { (make) in
            make.leading.top.bottom.equalTo(self.contentView).inset(10)
            make.width.equalTo(self.contentView).multipliedBy(0.5)
        }
        
        buttonLabel.snp.updateConstraints { (make) in
            make.trailing.equalTo(self.contentView).inset(10)
            make.centerY.equalTo(label)
        }
        
        super.updateConstraints()
    }
}

class CustomTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    let sampleText:[String] = ["Text test Text test Text test Text test ","Text test "]
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        configureTableview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTableview()
    }
    
    func configureTableview() {
        self.estimatedRowHeight = 150
        self.rowHeight = UITableViewAutomaticDimension
        
        self.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        self.dataSource = self
        self.delegate = self
        
        self.backgroundColor = .white
        self.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as! CustomCell
        
        cell.configure(with: sampleText[indexPath.row])
        return cell
    }
}

let frame = CGRect(x: 0, y: 0, width: 300, height: 500)
let tableview = CustomTableView(frame: frame, style: .plain)


PlaygroundPage.current.liveView = tableview

