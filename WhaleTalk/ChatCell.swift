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
    
    private var outgoingConstraint: NSLayoutConstraint!
    private var incomingConstraint: NSLayoutConstraint!
    
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
            bubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ]
        NSLayoutConstraint.activate(bubbleImageViewConstraints)
        
        outgoingConstraint = bubbleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        incomingConstraint = bubbleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func incoming(incoming: Bool) {
        if incoming {
            // Control which side of the screen the bubbleImageView resides
            incomingConstraint.isActive = true
            outgoingConstraint.isActive = false
            // Control which way the message bubble tail looks
            bubbleImageView.image = bubble.incoming
        }else {
            // Control which side of the screen the bubbleImageView resides
            incomingConstraint.isActive = false
            outgoingConstraint.isActive = true
            // Control which way the message bubble tail looks
            bubbleImageView.image = bubble.outgoing
        }
    }
}

let bubble = makeBubble()

func makeBubble() -> (incoming: UIImage, outgoing: UIImage) {
    let image = UIImage(named: "MessageBubble")
    
    let outgoing = coloredImage(image: image!, red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    let flippedImage = UIImage(cgImage: (image?.cgImage)!, scale: (image?.scale)!, orientation: UIImageOrientation.upMirrored)
    let incoming = coloredImage(image: flippedImage, red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    
    return (incoming!, outgoing!)
}

func coloredImage(image: UIImage, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIImage!{
    let rect = CGRect(origin: CGPoint.zero, size: image.size)
    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
    let context = UIGraphicsGetCurrentContext()
    image.draw(in: rect)
    
    context?.setFillColor(red: red, green: green, blue: blue, alpha: alpha)
    context?.setBlendMode(.sourceAtop)
    context?.fill(rect)
    
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}
