import UIKit
import SnapKit

class SignupViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        let text = "Already have an account? Sign in"
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "Sign in")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        label.attributedText = attributedString
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let fullNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Full name"
        field.borderStyle = .roundedRect
        field.backgroundColor = .systemGray6
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email address"
        field.borderStyle = .roundedRect
        field.backgroundColor = .systemGray6
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Create password"
        field.borderStyle = .roundedRect
        field.backgroundColor = .systemGray6
        field.isSecureTextEntry = true
        return field
    }()
    
    private let ageCheckbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "You confirm that you're over 13."
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupNavigationBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        [titleLabel, signInLabel, fullNameField, emailField, passwordField, 
         ageCheckbox, ageLabel, signUpButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        fullNameField.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(fullNameField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        ageCheckbox.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(24)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ageCheckbox)
            make.left.equalTo(ageCheckbox.snp.right).offset(8)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    private func setupActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSignInTap))
        signInLabel.addGestureRecognizer(tapGesture)
        
        ageCheckbox.addTarget(self, action: #selector(handleCheckboxTap), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        [fullNameField, emailField, passwordField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(handleBack)
        )
    }
    
    @objc private func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleSignInTap() {
        // Navigate to sign in screen
    }
    
    @objc private func handleCheckboxTap() {
        ageCheckbox.isSelected.toggle()
        validateForm()
    }
    
    @objc private func textFieldDidChange() {
        validateForm()
    }
    
    private func validateForm() {
        let isValid = !fullNameField.text!.isEmpty &&
            !emailField.text!.isEmpty &&
            !passwordField.text!.isEmpty &&
            ageCheckbox.isSelected
        
        signUpButton.isEnabled = isValid
        signUpButton.alpha = isValid ? 1.0 : 0.5
    }
    
    @objc private func handleSignUp() {
        // Implement sign up logic
    }
} 