//
//  MyOrderViewController.swift
//  Myct-Store
//
//  Created by ERASOFT on 20/05/22.
//

import UIKit

class MyOrderViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var orderTabelView: UITableView!
    
    
    //MARK: - Variables
    var viewModel: MyOrderViewModel = MyOrderViewModel()
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    //MARK: - InitializeView
    private func initializeView() {
        setUpTableview()
        loadOrders()
    }
    
    func setUpTableview() {
        orderTabelView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        orderTabelView.estimatedRowHeight = 300
        orderTabelView.rowHeight = UITableView.automaticDimension
    }
    
    func loadOrders() {
        viewModel.loadMyOrders { isOrderAPISuccess, apiFailedMessage in
            if isOrderAPISuccess {
                self.orderTabelView.reloadData()
            } else {
                print("Alert: API Failed")
            }
        }
    }
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return viewModel.numberOfSection() }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        let orderObject: Order = viewModel.getOrderDetailsForm(index: indexPath.section)
        cell.orderIdLabel.text = "#\(orderObject.displayId ?? "")"
        cell.dateAndTimeLabel.text = orderObject.dateAndTime
        cell.venderNameLabel.text = orderObject.venderName
        cell.venderImageView.image = UIImage(named: "myct.store")
        cell.paymentAmountLabel.text = "$\(orderObject.totalPrice ?? "")"
        cell.statusButton.setTitle(orderObject.status , for: .normal)
        cell.statusButton.layer.cornerRadius = 15
        cell.statusButton.layer.masksToBounds = true
        cell.orderStatus2.textColor = .systemGreen
        cell.orderStatus.textColor = .systemRed
        viewModel.cellValidation(status: orderObject.status!, statusButton: cell.statusButton, orderStatus1: cell.orderStatus, orderStatus2: cell.orderStatus2, slashLabel: cell.slashLabel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return UITableView.automaticDimension }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { return 10 }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? { return UIView() }
}
