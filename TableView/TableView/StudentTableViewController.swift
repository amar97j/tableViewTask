//
//  ViewController.swift
//  TableView
//
//  Created by Amora J. F. on 04/03/2024.
//

import UIKit
import SnapKit


class StudentTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let gpaLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(gpaLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        gpaLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
}

class StudentTableViewController: UITableViewController {
    
    var students: [Students] = [
        Students(name: "AHOUD", GPA: 4, ProfileImage: "aa"),
        Students(name: "YARA", GPA: 3, ProfileImage: "fdghjk")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(StudentTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        let stu = students[indexPath.row]
        
        cell.nameLabel.text = stu.name
        cell.gpaLabel.text = "GPA: \(stu.GPA)"
        cell.profileImageView.image = UIImage(named: stu.ProfileImage)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let selectedStudent = students[indexPath.row]
        detailVC.student = selectedStudent
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
