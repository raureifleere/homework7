//
//  ViewController.swift
//  testProject
//
//  Created by Bibisara Kenesova on 20.12.2022.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private lazy var header: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "Let to win!"
        return label
    }()
    
    private lazy var centralPicture: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "diamond")
        return imageView
    }()
    
    private lazy var randomNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "How many money do you want?"
        return label
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        let widthConstraint = button.widthAnchor.constraint(equalToConstant: 30.0)
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 30.0)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint])
        
        widthConstraint.constant = 200
        heightConstraint.constant = 50
        
        button.setTitle("Let's try? :)", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemMint
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(whenClick), for: .touchUpInside)
        button.addTarget(self, action: #selector(whenPress), for: .touchDown)
        return button
    }()
    
    @objc func whenPress() {
        randomNumber.text = "Let's see..."
    }
    
    @objc func whenClick() {
        let number = Int.random(in: 0...10000)
        randomNumber.text = "You win: \(number) $"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemCyan
        
        setupViews()
        setupConstrains()
        
    }


}

//MARK: - Setup views and constrains methods

private extension ViewController {
    func setupViews() {
        view.addSubview(header)
        view.addSubview(centralPicture)
        view.addSubview(randomNumber)
        view.addSubview(myButton)
    }
    
    func setupConstrains() {
        header.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(centralPicture.snp.top).inset(-50)
        }
        centralPicture.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        randomNumber.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(centralPicture.snp.bottom).inset(-50)
        }
        myButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(randomNumber.snp.bottom).inset(-100)
        }
    }
}
