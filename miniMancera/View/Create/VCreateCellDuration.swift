import UIKit

class VCreateCellDuration:VCreateCell
{
    private weak var modelFrame:MCreateFrame?
    private weak var viewSlider:VSlider!
    private weak var labelDuration:UILabel!
    private let numberFormatter:NumberFormatter
    private let deltaDuration:TimeInterval
    private let kImageWidth:CGFloat = 45
    private let kImageLeft:CGFloat = 20
    private let kLabelWidth:CGFloat = 300
    private let kVerticalMargin:CGFloat = 17
    private let kMaxDuration:TimeInterval = 15
    private let kMinDuration:TimeInterval = 1
    private let kMaxDecimals:Int = 0
    private let kMinIntergers:Int = 1
    private let kAfterUpdated:TimeInterval = 0.2
    
    override init(frame:CGRect)
    {
        deltaDuration = kMaxDuration - kMinDuration
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = kMinIntergers
        numberFormatter.positiveSuffix = NSLocalizedString("VCreateCellDuration_secondsSuffix", comment:"")
        
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
        image.image = #imageLiteral(resourceName: "assetGenericCreateDuration")
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.textColor = UIColor.black
        labelDuration.font = UIFont.regular(size:15)
        self.labelDuration = labelDuration
        
        addSubview(viewSlider)
        addSubview(image)
        addSubview(labelDuration)
        
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
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelDuration,
            toView:image)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kLabelWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate)
    {
        super.config(controller:controller)
        let modelFrame:MCreateFrame = controller.model.selectedFrameModel()
        self.modelFrame = modelFrame
        
        updateSlider()
        printDuration()
    }
    
    //MARK: private
    
    private func updateSlider()
    {
        guard
            
            let modelFrame:MCreateFrame = self.modelFrame
        
        else
        {
            return
        }
        
        let minDuration:TimeInterval = modelFrame.duration - kMinDuration
        let percentUsed:TimeInterval = minDuration / deltaDuration
        let floatPercentUsed:CGFloat = CGFloat(percentUsed)
        
        viewSlider.changeSlider(percentUsed:floatPercentUsed)
    }
    
    private func reverseSlider(percentUsed:CGFloat)
    {
        let percentDuration:TimeInterval = deltaDuration * TimeInterval(percentUsed)
        let realDuration:TimeInterval = percentDuration + kMinDuration
        modelFrame?.duration = realDuration
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.printDuration()
        }
    }
    
    private func printDuration()
    {
        guard
            
            let modelFrame:MCreateFrame = self.modelFrame
            
        else
        {
            return
        }
        
        let duration:NSNumber = modelFrame.duration as NSNumber
        let durationString:String? = numberFormatter.string(from:duration)
        
        labelDuration.text = durationString
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
