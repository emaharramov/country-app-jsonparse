import UIKit

class CityDetailViewController: UIViewController {

    var selectedCity: CityStruct?

    var scrollView = UIScrollView()
    var contentView = UIView()
    var flagField = UIImageView()
    var cityNameField = UILabel()
    var cityDetailField = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        if let selectedCity {
            self.title = selectedCity.name
            cityNameField.text = selectedCity.name
            cityDetailField.text = selectedCity.description
            flagField.image = UIImage(named: selectedCity.imageName)
        }
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(flagField)
        contentView.addSubview(cityNameField)
        contentView.addSubview(cityDetailField)
        
        flagField.layer.cornerRadius = 10
        flagField.clipsToBounds = true

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        flagField.translatesAutoresizingMaskIntoConstraints = false
        cityNameField.translatesAutoresizingMaskIntoConstraints = false
        cityDetailField.translatesAutoresizingMaskIntoConstraints = false

        cityNameField.font = UIFont.boldSystemFont(ofSize: 24)
        cityNameField.textAlignment = .center

        cityDetailField.textAlignment = .justified
        cityDetailField.font = UIFont.systemFont(ofSize: 16)
        cityDetailField.isEditable = false
        cityDetailField.isScrollEnabled = false

        flagField.contentMode = .scaleToFill

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            flagField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            flagField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            flagField.widthAnchor.constraint(equalToConstant: 200),
            flagField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            flagField.heightAnchor.constraint(equalToConstant: 200),
            
            cityNameField.topAnchor.constraint(equalTo: flagField.bottomAnchor, constant: 20),
            cityNameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cityNameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            cityDetailField.topAnchor.constraint(equalTo: cityNameField.bottomAnchor, constant: 20),
            cityDetailField.leadingAnchor.constraint(equalTo: cityNameField.leadingAnchor),
            cityDetailField.trailingAnchor.constraint(equalTo: cityNameField.trailingAnchor),
            cityDetailField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
