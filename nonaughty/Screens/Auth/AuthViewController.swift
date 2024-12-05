import UIKit
import SnapKit
import GoogleSignIn

class AuthViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "AppLogo")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Learn a language"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "with Airlearn"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with email", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        let text = "By continuing, you agree to our terms & privacy policy"
        let attributedString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "terms")
        let range2 = (text as NSString).range(of: "privacy policy")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range1)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range2)
        label.attributedText = attributedString
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        [logoImageView, titleLabel, subtitleLabel, appleButton, googleButton, emailButton, termsLabel].forEach {
            view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        appleButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(googleButton.snp.top).offset(-12)
            make.height.equalTo(50)
        }
        
        googleButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(emailButton.snp.top).offset(-12)
            make.height.equalTo(50)
        }
        
        emailButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(termsLabel.snp.top).offset(-24)
            make.height.equalTo(50)
        }
        
        termsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    private func setupActions() {
        appleButton.addTarget(self, action: #selector(handleAppleLogin), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(handleEmailLogin), for: .touchUpInside)
    }
    
    @objc private func handleAppleLogin() {
        // Implement Apple Sign In
    }
    
    @objc private func handleGoogleLogin() {
        // Implement Google Sign In
    }
    
    @objc private func handleEmailLogin() {
        let signupVC = SignupViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
} 