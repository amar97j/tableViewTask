//
//  DetailsViewController.swift
//  TableView
//
//  Created by Amora J. F. on 04/03/2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    var student: Students?

    private let nameLabel = UILabel()
    private let gpaLabel = UILabel()
    private let profileImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupViews()
        setupLayout()
        configureWithStudent()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Student Details"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

    private func setupViews() {
        view.backgroundColor = .white

        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        gpaLabel.font = .systemFont(ofSize: 16, weight: .medium)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50 
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor

        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(gpaLabel)
    }

    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        gpaLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    private func configureWithStudent() {
        nameLabel.text = "Student: \(student?.name ?? "N/A")"
        gpaLabel.text = "GPA: \(student?.GPA ?? 0)"
        profileImageView.image = UIImage(named: student?.ProfileImage ?? "")
    }
}
