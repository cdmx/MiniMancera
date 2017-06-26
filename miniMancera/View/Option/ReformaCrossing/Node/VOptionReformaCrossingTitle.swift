import SpriteKit

class VOptionReformaCrossingTitle:SKLabelNode
{
    private let kVerticalAdd:CGFloat = -12
    private let kFontSize:CGFloat = 20
    
    override init()
    {
        super.init(fontNamed:UIFont.kFontGame)
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionReformaCrossingZPosition.Title.rawValue
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kVerticalAdd
        
        position = CGPoint(x:sceneWidth_2, y:positionY)
    }
}
