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
        self.contentView.addSubview(label)
        return label
    }()
    
    public func configure(with text:String) {
        label.text = text
    
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        //what to do with the constraints?
        
        super.updateConstraints()
    }
}

class CustomTableView:UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        tableview.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        tableview.dataSource = TableViewDataSource()
        
        //do I need to add anything else here?
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

class TableViewDataSource:NSObject, UITableViewDataSource {
    let sampleText:[String] = ["Text test Text test Text test Text test ","Text test "]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as! CustomCell
        
        cell.configure(with: sampleText[indexPath.row])
        
        return cell
    }
}
let frame = CGRect(x: 0, y: 0, width: 400, height: 700)
let tableview = CustomTableView(frame: frame , style: .plain)
tableview.dataSource = TableViewDataSource()


PlaygroundPage.current.liveView = tableview
