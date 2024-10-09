import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedCountry: CountryStruct?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCountry?.name
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cityCell")
        self.view.addSubview(tableView)
        
        let nib = UINib(nibName: "CitiesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CitiesTableViewCell.identifier)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCountry?.cities.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as! CitiesTableViewCell
        if let city = selectedCountry?.cities[indexPath.row] {
            cell.configure(with: city)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        controller.selectedCity = selectedCountry?.cities[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}
