//
//  ChatCell.swift
//  WhaleTalk
//
//  Created by Danny Gilbert on 3/14/17.
//  Copyright © 2017 Danny Gilbert. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    let messageLabel: UILabel = UILabel()
    private let bubbleImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        let messageLabelConstraints: [NSLayoutConstraint] = [
            messageLabel.centerXAnchor.constraint(equalTo: bubbleImageView.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: bubbleImageView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(messageLabelConstraints)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        let bubbleImageViewConstraints: [NSLayoutConstraint] = [
            bubbleImageView.widthAnchor.constraint(equalTo: messageLabel.widthAnchor, constant: 50),
            bubbleImageView.heightAnchor.constraint(equalTo: messageLabel.heightAnchor),
            bubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bubbleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(bubbleImageViewConstraints)
        bubbleImageView.tintColor = UIColor.blue
        bubbleImageView.image = UIImage(named: "MessageBubble")?.withRenderingMode(.alwaysTemplate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
