import UIKit

class VCreateCellFontSize:VCreateCell
{
    private weak var modelFont:MCreateFont?
    private weak var viewSlider:VSlider!
    private weak var labelFontsize:UILabel!
    private let numberFormatter:NumberFormatter
    private let deltaFontSize:CGFloat
    private let kImageWidth:CGFloat = 45
    private let kImageLeft:CGFloat = 20
    private let kLabelWidth:CGFloat = 300
    private let kVerticalMargin:CGFloat = 17
    private let kMaxFontSize:CGFloat = 60
    private let kMinFontSize:CGFloat = 8
    private let kMaxDecimals:Int = 0
    private let kMinIntergers:Int = 1
    private let kAfterUpdated:TimeInterval = 0.2
    
    override init(frame:CGRect)
    {
        deltaFontSize = kMaxFontSize - kMinFontSize
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = kMinIntergers
        numberFormatter.positiveSuffix = NSLocalizedString("VCreateCellFontSize_pointSize", comment:"")
        
        super.init(frame:frame)
        
        let viewSlider:VSlider = VSlider(
        percentUsed:0,
        sliderChange:
        { [weak self] (percentUsed:CGFloat) in
            
            self?.reverseSlider(percentUsed:percentUsed)
        })
        { [weak self] in
            
            self?.refreshFrame()
        }
        
        self.viewSlider = viewSlider
        
        let image:UIImageView = UIImageView()
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.image = #imageLiteral(resourceName: "assetGenericCreateFontSize")
        
        let labelFontsize:UILabel = UILabel()
        labelFontsize.translatesAutoresizingMaskIntoConstraints = false
        labelFontsize.backgroundColor = UIColor.clear
        labelFontsize.isUserInteractionEnabled = false
        labelFontsize.textColor = UIColor.black
        labelFontsize.font = UIFont.regular(size:15)
        self.labelFontsize = labelFontsize
        
        addSubview(viewSlider)
        addSubview(image)
        addSubview(labelFontsize)
        
        NSLayoutConstraint.equalsVertical(
            view:viewSlider,
            toView:self,
            margin:kVerticalMargin)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSlider,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:image,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:image,
            toView:self,
            constant:kImageLeft)
        NSLayoutConstraint.width(
            view:image,
            constant:kImageWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelFontsize,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelFontsize,
            toView:image)
        NSLayoutConstraint.width(
            view:labelFontsize,
            constant:kLabelWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate)
    {
        super.config(controller:controller)
        let modelFont:MCreateFont = controller.model.font
        self.modelFont = modelFont
        
        updateSlider()
        printFontSize()
    }
    
    //MARK: private
    
    private func updateSlider()
    {
        guard
            
            let modelFont:MCreateFont = self.modelFont
            
        else
        {
            return
        }
        
        let minFontSize:CGFloat = modelFont.fontSize - kMinFontSize
        let percentUsed:CGFloat = minFontSize / deltaFontSize
        
        viewSlider.changeSlider(percentUsed:percentUsed)
    }
    
    private func reverseSlider(percentUsed:CGFloat)
    {
        let percentFontSize:CGFloat = deltaFontSize * percentUsed
        let realFontSize:CGFloat = percentFontSize + kMinFontSize
        modelFont?.fontSize = realFontSize
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.printFontSize()
        }
    }
    
    private func printFontSize()
    {
        guard
            
            let modelFont:MCreateFont = self.modelFont
            
        else
        {
            return
        }
        
        let fontSize:NSNumber = modelFont.fontSize as NSNumber
        let fontSizeString:String? = numberFormatter.string(from:fontSize)
        
        labelFontsize.text = fontSizeString
    }
    
    private func refreshFrame()
    {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterUpdated)
        { [weak controller] in
            
            controller?.refreshFrame()
        }
    }
}
