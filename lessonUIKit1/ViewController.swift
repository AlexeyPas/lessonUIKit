//
//  ViewController.swift
//  lessonUIKit1
//
//  Created by Алексей Пасынков on 24.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    var lab: Character = "+"
    
    var count = 0{
                didSet{
                    updateButton()
                }
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let call = UITableViewCell()
        call.backgroundColor = indexPath.row.isMultiple(of: 2) ? .red : .green
        call.textLabel?.text = "Row: \(indexPath.row)"
        return call
    }
    

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        labelView.text = "Функция: \(#function)"
        labelView.textColor = .blue
        imageView.image = UIImage(named: "boat")
        
        if let text = textView.text{
            textView.text = String(text.reversed())
        }
        
        //UIScrollView
        let imageView = UIImageView(image: UIImage(named: "boat"))
        let scrollView = UIScrollView(frame: CGRect(x: view.bounds.midX - 150, y: 240, width: 500, height: 100))
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
        
        //UITableView
        tableView.backgroundColor = .blue
        tableView.dataSource = self
        
        //UIButton
        updateButton()
    }
  
        func updateButton() {
            button.setTitle("Count: \(count)", for: [])
            print(#line, #function, lab)
        }
    
    @IBAction func sigmentControll(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                count = 0
                lab = "+"
            case 1:
                lab = "-"
            case 2:
                lab = "+"
            default:
                fatalError("Error \(sender.selectedSegmentIndex) in \(#line) \(#function) ")
            }
        }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch lab {
        case "+":
            count += 1
        case "-":
            count -= 1
        default:
            count += 0
            lab = "+"
        }

    }
    
    
    @IBAction func dataEntered(_ sender: UITextField) {
        print(#line, #function, sender.tag, sender.text ?? "nil")
    }
    
   
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sender.value = Float(25 * Int(sender.value / 25))
        print(sender.value)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        view.backgroundColor = sender.isOn ? .white : .gray
    }
    
}

