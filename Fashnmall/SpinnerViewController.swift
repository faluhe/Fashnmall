//
//  SpinnerViewController.swift
//  Fashnmall
//
//  Created by Ismailov Farrukh on 2021/4/27.
//
 
import UIKit

class SpinnerViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .gray)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = #colorLiteral(red: 0.8188778758, green: 0.337186873, blue: 0.2858384252, alpha: 1)
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
   
}
