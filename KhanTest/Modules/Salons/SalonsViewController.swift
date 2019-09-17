//
//  SalonsViewController.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import PinLayout

final class SalonsViewController: UIViewController {
    
    enum Constants {
        static let cellHeight: CGFloat = 130
    }
    
    private var salons: [SalonInfo] = []
    
    lazy var service: SalonAbstractService = SalonService()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: SalonCell.identifier, bundle: nil),
            forCellReuseIdentifier: SalonCell.identifier
        )
        tableView.separatorStyle = .none
        tableView.contentInset.top = 8
        return tableView
    }()
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin
            .all()
            .marginTop(view.safeAreaInsets.top)
        activityIndicator.pin
            .center()
    }
    
}

private extension SalonsViewController {
    
    func commonInit() {
        title = "Salons"
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        [tableView, activityIndicator].forEach { [weak self] in
            self?.view.addSubview($0)
        }
    }
    
    func loadData() {
        activityIndicator.startAnimating()
        service.fetchSalons(for: .popular) { [weak self] (salons) in
            self?.salons = salons
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
        }
    }
    
}

extension SalonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SalonCell.identifier, for: indexPath) as! SalonCell
        cell.configure(model: salons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // TODO: Refactor that vc shouldn't know about SalonViewController
        guard let salonViewController = UIStoryboard.instantiate(ofType: SalonViewController.self) else {
            return
        }
        salonViewController.salonId = salons[indexPath.row].id
        navigationController?.pushViewController(salonViewController, animated: true)
    }
    
}
