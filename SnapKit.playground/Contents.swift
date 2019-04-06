//: Please build the scheme 'SnapKitPlayground' first
import Foundation
import UIKit
import PlaygroundSupport
import SnapKit

PlaygroundPage.current.needsIndefiniteExecution = true

class CustomCell:UITableViewCell {
    static let reuseID = "CustomCellREUSEID"
    
    let imgURL = URL(string: "http://lorempixel.com/400/400/")
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        //what to do with the constraints, or how do I add constraints here?

        super.updateConstraints()
    }
}

class CustomTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    let sampleText:[String] = ["Text test Text test Text test Text test ",
                               "Text test Text test ",
                               "Text test Text test Text test ",
                               "Text test Text test Text test Text test Text test ",
                               "Text test "]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureTableview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTableview()
    }
    
    func configureTableview() {
        //What do I need to add here so that the tableview auto calculate the height?
        
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
let tableView = CustomTableView(frame: frame)


PlaygroundPage.current.liveView = tableView

