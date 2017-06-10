import UIKit

class VCreateCellCardText:UITextView, UITextViewDelegate
{
    private weak var model:MCreateFrame?
    private let drawingOptions:NSStringDrawingOptions
    private let insetsHorizontal2:CGFloat
    private let kInsetsHorizontal:CGFloat = 30
    private let kEmpty:String = ""
    
    init()
    {
        let color:UIColor = UIColor.white
        insetsHorizontal2 = kInsetsHorizontal + kInsetsHorizontal
        drawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesLineFragmentOrigin,
            NSStringDrawingOptions.usesFontLeading])
        
        super.init(frame:CGRect.zero, textContainer:nil)
        text = kEmpty
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        textColor = color
        tintColor = color
        textAlignment = NSTextAlignment.center
        isScrollEnabled = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        keyboardType = UIKeyboardType.alphabet
        keyboardAppearance = UIKeyboardAppearance.light
        keyboardDismissMode = UIScrollViewKeyboardDismissMode.interactive
        delegate = self
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        updateInsets()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func updateInsets()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let usableWidth:CGFloat = width - insetsHorizontal2
        let usableHeight:CGFloat = height
        let usableSize:CGSize = CGSize(width:usableWidth, height:usableHeight)
        let boundingRect:CGRect = attributedText.boundingRect(
            with:usableSize,
            options:drawingOptions,
            context:nil)
        let textHeight:CGFloat = ceil(boundingRect.maxY)
        var insetsTop:CGFloat = (usableHeight - textHeight) / 2.0
        
        if insetsTop < 0
        {
            insetsTop = 0
        }
        
        textContainerInset = UIEdgeInsets(
            top:insetsTop,
            left:kInsetsHorizontal,
            bottom:0,
            right:kInsetsHorizontal)
    }
    
    private func notifyChanges()
    {
        guard
            
            let model:MCreateFrame = self.model
        
        else
        {
            return
        }
        
        NotificationCenter.default.post(
            name:Notification.frameTextChanged,
            object:model)
    }
    
    private func textChanged()
    {
        model?.text = text
        updateInsets()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.notifyChanges()
        }
    }
    
    //MARK: public
    
    func config(model:MCreate)
    {
        let selectedFrame:MCreateFrame = model.selectedFrameModel()
        text = selectedFrame.text
        font = model.font.selectedFontObject()
        self.model = selectedFrame
        
        updateInsets()
    }
    
    func clear()
    {
        text = kEmpty
        textChanged()
    }
    
    //MARK: textView delegate
    
    func textViewDidChange(_ textView:UITextView)
    {
        textChanged()
    }
}
