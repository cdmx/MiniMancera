import SpriteKit

class MOptionWhistlesVsZombiesMenu
{
    private(set) var position:CGPoint
    
    init()
    {
        position = CGPoint.zero
    }
    
    //MARK: public
    
    func update(sceneSize:CGSize)
    {
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        
        position = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
    }
}
