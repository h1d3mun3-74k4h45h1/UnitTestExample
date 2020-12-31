import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextFieldHeaderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldHeaderLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
        
        var name: String?
        if let nameText = nameTextField.text,
           nameText.count != 0 {
            name = nameText
        }
        
        var email: String?
        if let emailText = emailTextField.text,
           emailText.count != 0 {
            email = emailText
        }
        
        let userProfile = UserProfile(name: name, email: email)
        
        guard userProfile.validate() else {
            let alertController = UIAlertController(
                title: "入力エラー",
                message: "名前を入力してください",
                preferredStyle: .alert
            )
            alertController.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: nil
                )
            )
            present(alertController,
                    animated: true,
                    completion: nil)
            return
        }
        
        let alertController = UIAlertController(
            title: "登録完了",
            message: "ありがとうございます",
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
        )
        present(alertController,
                animated: true,
                completion: nil)

    }
}

