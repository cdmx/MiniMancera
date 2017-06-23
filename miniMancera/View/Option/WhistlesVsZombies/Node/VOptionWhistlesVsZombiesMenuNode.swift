import SpriteKit

extension VOptionWhistlesVsZombiesMenu
{
    private static let kFontSize:CGFloat = 16
    private static let kPositionY:CGFloat = 100
    
    class func factoryTitle(menuSize:CGSize) -> SKLabelNode
    {
        let width:CGFloat = menuSize.width
        let width_2:CGFloat = width / 2.0
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelTitle.text = String.localizedWhistlesVsZombies(key:"VOptionWhistlesVsZombiesMenu_labelTitle")
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:kPositionY)
        
        return labelTitle
    }
}
