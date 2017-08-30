//: Please build the scheme 'SnapKitPlayground' first
import Foundation
import UIKit
import PlaygroundSupport
import SnapKit


var str = "Hello, playground"
let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
view.backgroundColor = .white

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view
let label:UILabel = {
    let label = UILabel()
    label.text = str
    label.textAlignment = .center
    return label
}()

view.addSubview(label)

label.snp.updateConstraints { (make) in
    make.top.equalTo(view).offset(10)
    make.centerX.equalTo(view)
}

let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 400, height: 700))


class TableViewDataSource:NSObject, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

tableview.dataSource = TableViewDataSource()


//PlaygroundPage.current.liveView = tableview