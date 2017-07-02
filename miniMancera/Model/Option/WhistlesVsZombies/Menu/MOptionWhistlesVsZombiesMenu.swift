import SpriteKit

class MOptionWhistlesVsZombiesMenu
{
    let whistleActionAnimation:SKAction
    private(set) var items:[MOptionWhistlesVsZombiesMenuItem]
    private(set) var position:CGPoint
    
    init()
    {
        position = CGPoint.zero
        items = []
        whistleActionAnimation = MOptionWhistlesVsZombiesMenu.factoryWhistleAnimation()
    }
    
    //MARK: public
    
    func update(sceneSize:CGSize)
    {
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        
        position = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
        items = MOptionWhistlesVsZombiesMenu.factoryItems(sceneSize:sceneSize)
    }
}
