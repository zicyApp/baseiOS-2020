//
//  HomeViewController.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

class FactoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: TLabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: FactoryViewModel?
    private var refreshControl: UIRefreshControl?
    
    private func getVM() -> FactoryViewModel {
        guard let viewModel = self.viewModel else {fatalError("error!!!")}
        return viewModel
    }
    
    func set(viewModel: FactoryViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setText()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        if let rc = self.refreshControl {
            self.tableView.addSubview(rc)
        }
        self.refresh()
    }
    
    @objc private func refresh() {
        self.getVM().fetchList(isReset: true)
    }
    
    private func setText() {
        self.titleLabel.text = NSLocalizedString(i18Interface.factoriesTitle, comment: "Factories")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension FactoryViewController: FactoryViewModelDelegate {
    func onDataLoadSuccess() {
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func onDataLoadError() {
        
    }
}

extension FactoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getVM().factories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factory = self.getVM().factories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactoryCell", for: indexPath) as! FactoryCell
        cell.setUpCell(factory: factory, indexPath: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // let factory = self.getVM().factories[indexPath.row]
        return 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        if indexPath.row > self.getVM().factories.count - 3 {
            self.getVM().fetchMore()
        }
    }
}
