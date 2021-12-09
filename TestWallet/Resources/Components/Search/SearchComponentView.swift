//
//  SearchComponentView.swift
//  TestWallet
//
//  Created by Bogdan on 06.12.2021.
//

import UIKit

@IBDesignable
class SearchComponentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(xibView)
    }
    
    private func loadViewFromXib() -> UIView {
        let bundle = Bundle(for:  type(of: self))
        
        let nib = UINib(nibName: "SearchComponentView", bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
}
