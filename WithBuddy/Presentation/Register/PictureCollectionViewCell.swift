//
//  PictureCollectionViewCell.swift
//  WithBuddy
//
//  Created by 김두연 on 2021/11/02.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    static let identifer = "PictureCollectionViewCell"
    
    private var photoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.photoImage)
        self.configureLayout()
    }
    
    private func configure() {
        
    }
    
    private func configureLayout() {
        self.photoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.photoImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.photoImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.photoImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.photoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}