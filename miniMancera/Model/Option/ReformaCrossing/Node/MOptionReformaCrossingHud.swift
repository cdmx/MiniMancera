import UIKit
import SpriteKit

class MOptionReformaCrossingHud:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private weak var labelTime:SKLabelNode!
    private let kTimeFontSize:CGFloat = 25
    private let kMargin:CGFloat = 45
    private let kTimePositionX:CGFloat = 80
    private let kTimePositionY:CGFloat = -10
    private let kZPosition:CGFloat = 10001
    private let kTimeZPosition:CGFloat = 10005
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        
        let labelTime:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontRegular)
        labelTime.fontSize = kTimeFontSize
        labelTime.fontColor = SKColor.white
        labelTime.position = CGPoint(x:kTimePositionX, y:kTimePositionY)
        labelTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        labelTime.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelTime.zPosition = kTimeZPosition
        self.labelTime = labelTime
        
        addChild(labelTime)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posX:CGFloat = sceneWidth - sizeWidth_2
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:posX, y:posY)
        
        return point
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        let deltaTime:TimeInterval = controller.model.kMaxGameTime - elapsedTime
        
        if deltaTime < 0
        {
            controller.timeOut()
        }
        else
        {
            let time:Int = Int(deltaTime)
            let timeString:String = "\(time)"
            labelTime.text = timeString
        }
    }
}
