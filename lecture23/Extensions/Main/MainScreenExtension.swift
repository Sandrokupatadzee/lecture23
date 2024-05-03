import UIKit

extension MainScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.catFacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatFactCell.identifier, for: indexPath) as? CatFactCell else {
            fatalError("Could not dequeue reusable cell")
        }
        let catFact = self.catFacts[indexPath.section]
        let cellViewModel = CatFactTableViewCellViewModel(fact: catFact)
        cell.updateCell(with: cellViewModel)
        cell.backgroundColor = .tertiarySystemBackground
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 18
        cell.layer.borderColor = UIColor.secondaryLabel.cgColor
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return spaceBetweenSections
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
}
