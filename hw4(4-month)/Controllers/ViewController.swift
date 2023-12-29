//
//  ViewController.swift
//  hw4(4-month)
//
//  Created by user on 28/12/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = MakerView.shared.createLabel(text: "Create New Password 🔐", textColor: .black, fontSize: 28, fontWeight: .bold)
    
    private lazy var descriptionLabel: UILabel = MakerView.shared.createLabel(
        text: "Enter your new password. If you forget it, then you have to do forgot password.", textColor: .black, fontSize: 18, fontWeight: .thin, numberOfLines: 2)
    
    private lazy var passwordLabel: UILabel = MakerView.shared.createLabel(text: "Password", textColor: .black, fontSize: 16, fontWeight: .bold)
    
    private lazy var passwordTF: UITextField = MakerView.shared.createTF(textColor: .black, placeholder: "Enter your password", ofSize: 20, weight: .light, cornerRadius: 10, leftView: true, rightView: true)

    private lazy var passwordEye: UIButton = MakerView.shared.createButton(tintColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1), setImage: UIImage(systemName: "eye.fill"))
    
    private lazy var passwordBottomView: UIView = MakerView.shared.createView(backgroundColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1))
    
    private lazy var passwordConfirmLabel: UILabel = MakerView.shared.createLabel(text: "Confirm Password", textColor: .black, fontSize: 16, fontWeight: .bold)
    
    private lazy var passwordConfirmTF: UITextField = MakerView.shared.createTF(textColor: .black, placeholder: "Confirm your password", ofSize: 20, weight: .light, cornerRadius: 10, leftView: true, rightView: true)
    
    private lazy var passwordConfirmEye: UIButton = MakerView.shared.createButton(tintColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1), setImage: UIImage(systemName: "eye.fill"))
    
    private lazy var passwordConfirmBottomView: UIView = MakerView.shared.createView(backgroundColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1))
    
    private lazy var rememberImage: UIImageView = MakerView.shared.createImage(image: UIImage(named: "checkmark"), tintColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1))
    
    private lazy var rememberLabel: UILabel = MakerView.shared.createLabel(text: "Remember me", textColor: .black, fontSize: 18, fontWeight: .semibold)
    
    private lazy var continueButton: UIButton = MakerView.shared.createButton(text: "Continue", textColor: .white, fontSize: 16, fontWeight: .bold, cornerRadius: 16, backgroundColor: UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1), isEnabled: false)
    
    
    private var isPasswordShow = false
    private var isPasswordConfirmShow = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    private func setupUI() {
        view.backgroundColor = .white
        configureTitleLabel()
        configureDescriptionLabel()
        configurePasswordLabel()
        configurePasswordTextField()
        configurePasswordEye()
        configurePasswordView()
        configurePasswordConfirmLabel()
        configurePasswordConfirmTextField()
        configurePasswordConfirmEye()
        configurePasswordConfirmView()
        configureRememberMeImage()
        configureRememberMeLabel()
        configureContinueButton()
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }

    private func configureDescriptionLabel() {
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }

    private func configurePasswordLabel() {
        view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
        }
    }
    
    private func configurePasswordTextField() {
        view.addSubview(passwordTF)
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        passwordTF.addTarget(self, action: #selector(validatePasswords), for: .editingChanged)
    }
    
    private func configurePasswordEye() {
        view.addSubview(passwordEye)
        
        passwordEye.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(14)
            make.trailing.equalToSuperview().offset(-34)
            make.height.width.equalTo(24)
        }
        
        passwordEye.addTarget(self, action: #selector(passwordShowChange), for: .touchUpInside)
    }
    
    private func configurePasswordView() {
        view.addSubview(passwordBottomView)
        
        passwordBottomView.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
    }

    private func configurePasswordConfirmLabel() {
        view.addSubview(passwordConfirmLabel)
        
        passwordConfirmLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordBottomView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
        }
    }
    
    private func configurePasswordConfirmTextField() {
        view.addSubview(passwordConfirmTF)
        
        passwordConfirmTF.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        passwordConfirmTF.addTarget(self, action: #selector(validatePasswords), for: .editingChanged)
    }
    
    private func configurePasswordConfirmEye() {
        view.addSubview(passwordConfirmEye)
        
        passwordConfirmEye.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmLabel.snp.bottom).offset(14)
            make.trailing.equalToSuperview().offset(-34)
            make.height.width.equalTo(24)
        }
        
        passwordConfirmEye.addTarget(self, action: #selector(passwordConfirmShowChange), for: .touchUpInside)
    }
    
    private func configurePasswordConfirmView() {
        view.addSubview(passwordConfirmBottomView)
        
        passwordConfirmBottomView.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmTF.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
    }
    
    private func configureRememberMeImage() {
        view.addSubview(rememberImage)
        
        rememberImage.snp.makeConstraints { make in
            make.top.equalTo(passwordConfirmBottomView.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.height.width.equalTo(24)
        }
    }
    
    private func configureRememberMeLabel() {
        view.addSubview(rememberLabel)
        
        rememberLabel.snp.makeConstraints { make in
            make.top.equalTo(rememberImage.snp.top)
            make.leading.equalTo(rememberImage.snp.trailing).offset(16)
        }
    }
    
    private func configureContinueButton() {
        view.addSubview(continueButton)
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(58)
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    private func handleChangeSecureAndImageTextField(isShow: Bool, textField: UITextField, button: UIButton) {
        if isShow == true {
            textField.isSecureTextEntry = true
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        else {
            textField.isSecureTextEntry = false
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @objc func passwordShowChange(_ sender: UIButton) {
        isPasswordShow = !isPasswordShow
        handleChangeSecureAndImageTextField(isShow: isPasswordShow, textField: passwordTF, button: passwordEye)
    }
    
    @objc func passwordConfirmShowChange(_ sender: UIButton) {
        isPasswordConfirmShow = !isPasswordConfirmShow
        handleChangeSecureAndImageTextField(isShow: isPasswordConfirmShow, textField: passwordConfirmTF, button: passwordConfirmEye)
        
    }
    
    @objc func validatePasswords(_ sender: UITextField) {
        let isPasswordsHasText = passwordTF.hasText && passwordConfirmTF.hasText
        
        if isPasswordsHasText == true, let passwordText = passwordTF.text, let passwordConfirmText = passwordConfirmTF.text  {
            if passwordText == passwordConfirmText {
                continueButton.isEnabled = true
                continueButton.backgroundColor = UIColor(red: 0.961, green: 0.282, blue: 0.29, alpha: 1)
            }
            else {
                continueButton.isEnabled = false
                continueButton.backgroundColor = .lightGray
            }
        }
    }
    
    @objc func continueButtonTapped(_ sender: UIButton) {
        passwordTF.text = ""
        passwordConfirmTF.text = ""
        continueButton.isEnabled = false
        continueButton.backgroundColor = .lightGray
        let vc = SecondVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

