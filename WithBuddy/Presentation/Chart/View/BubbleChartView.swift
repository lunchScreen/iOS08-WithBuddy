//
//  BubbleChartView.swift
//  WithBuddy
//
//  Created by 박정아 on 2021/11/11.
//

import UIKit

final class BubbleChartView: UIView {
    
    private let nameLabel = NameLabel()
    private let titleLabel = TitleLabel()
    private let whiteView = WhiteView()
    private let firstBubbleImageView = UIImageView()
    private let secondBubbleImageView = UIImageView()
    private let thirdBubbleImageView = UIImageView()
    private let fourthBubbleImageView = UIImageView()
    private let fifthBubbleImageView = UIImageView()
    private let defaultView = DefaultView()
    
    private let maxLength = CGFloat(130)
    private var maxCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    func update(name: String) {
        self.nameLabel.text = name
    }
    
    func update(list: [Buddy]) {
        let first = list.indices ~= 0 ? list[0] : nil
        let second = list.indices ~= 1 ? list[1] : nil
        let third = list.indices ~= 2 ? list[2] : nil
        let fourth = list.indices ~= 3 ? list[3] : nil
        let fifth = list.indices ~= 4 ? list[4] : nil
        
        if first == nil {
            self.defaultView.isHidden = false
            return
        }
        
        let constantX = CGFloat(60)
        let constantY = CGFloat(50)
        self.defaultView.isHidden = true
        self.update(imageView: self.firstBubbleImageView, face: first?.face, xValue: 0, yValue: 0)
        self.update(imageView: self.secondBubbleImageView, face: second?.face, xValue: -constantX, yValue: -constantY)
        self.update(imageView: self.thirdBubbleImageView, face: third?.face, xValue: constantX, yValue: constantY)
        self.update(imageView: self.fourthBubbleImageView, face: fourth?.face, xValue: -constantX, yValue: constantY)
        self.update(imageView: self.fifthBubbleImageView, face: fifth?.face, xValue: constantX, yValue: -constantY)
    }
    
    private func update(imageView: UIImageView, face: String?, xValue: CGFloat, yValue: CGFloat) {
        if let face = face {
            imageView.image = UIImage(named: face)
            imageView.isHidden = false
            if imageView != self.firstBubbleImageView {
                let firstOrigin = self.firstBubbleImageView.frame.origin
                imageView.frame = CGRect(x: firstOrigin.x + xValue, y: firstOrigin.y + yValue, width: self.maxLength, height: self.maxLength)
            }
            return
        }
        imageView.isHidden = true
    }
    
    private func configure() {
        self.configureNameLabel()
        self.configureTitleLabel()
        self.configureWhiteView()
        self.configureChart()
        self.configureDefaultView()
    }
    
    private func configureNameLabel() {
        self.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        self.addSubview(self.titleLabel)
        self.titleLabel.text = "님이 많이 만난 버디"
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor)
        ])
    }
    
    private func configureWhiteView() {
        self.addSubview(self.whiteView)
        self.whiteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.whiteView.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.whiteView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            self.whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.whiteView.heightAnchor.constraint(equalToConstant: 250),
            self.whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureChart() {
        self.defaultView.isHidden = true
        self.whiteView.addSubview(self.secondBubbleImageView)
        self.whiteView.addSubview(self.thirdBubbleImageView)
        self.whiteView.addSubview(self.fourthBubbleImageView)
        self.whiteView.addSubview(self.fifthBubbleImageView)
        self.whiteView.addSubview(self.firstBubbleImageView)
        self.configureFirstBubble()
        self.configureBubbles()
    }
    
    private func configureFirstBubble() {
        self.firstBubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.firstBubbleImageView.image = UIImage(named: "FacePurple1")
        NSLayoutConstraint.activate([
            self.firstBubbleImageView.centerXAnchor.constraint(equalTo: self.whiteView.centerXAnchor),
            self.firstBubbleImageView.centerYAnchor.constraint(equalTo: self.whiteView.centerYAnchor),
            self.firstBubbleImageView.widthAnchor.constraint(equalToConstant: self.maxLength),
            self.firstBubbleImageView.heightAnchor.constraint(equalToConstant: self.maxLength)
        ])
    }
    
    private func configureBubbles() {
        self.secondBubbleImageView.isHidden = true
        self.thirdBubbleImageView.isHidden = true
        self.fourthBubbleImageView.isHidden = true
        self.fifthBubbleImageView.isHidden = true
    }
    
    private func configureDefaultView() {
        self.whiteView.addSubview(self.defaultView)
        self.defaultView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.defaultView.centerXAnchor.constraint(equalTo: self.whiteView.centerXAnchor),
            self.defaultView.centerYAnchor.constraint(equalTo: self.whiteView.centerYAnchor),
            self.defaultView.widthAnchor.constraint(equalToConstant: 200),
            self.defaultView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
