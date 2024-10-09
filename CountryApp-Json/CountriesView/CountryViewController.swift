import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = CountryVM()
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Countries"
        setupTableView()
        
        viewModel.configureList {
            self.myTableView.reloadData()
        }
    }
    
    private func setupTableView() {
        myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self

        self.view.addSubview(myTableView)

        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let nib = UINib(nibName: "CountriesTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: CountriesTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as! CountriesTableViewCell
        cell.configure(with: viewModel.listItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CitiesViewController") as! CitiesViewController
        controller.selectedCountry = viewModel.listItems[indexPath.row] 
        navigationController?.show(controller, sender: nil)
    }
}
