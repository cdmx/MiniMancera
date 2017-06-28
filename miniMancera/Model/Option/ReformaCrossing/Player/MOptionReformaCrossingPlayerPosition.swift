import UIKit

class MOptionReformaCrossingPlayerPosition
{
    private let positionX:CGFloat
    private var positionY:CGFloat
    private var safePositionY:CGFloat
    private let kAddPositionY:CGFloat = 205
    
    init()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        positionX = sceneWidth / 2.0
        positionY = 0
        safePositionY = 0
    }
    
    //MARK: public
    
    func playerView(view:VOptionReformaCrossingPlayer)
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let height_2:CGFloat = view.modelTexture.height_2
        positionY = height_2
        safePositionY = sceneHeight_2 + height_2 + kAddPositionY
        view.position = makePoint()
    }
    
    func makePoint() -> CGPoint
    {
        let point:CGPoint = CGPoint(x:positionX, y:positionY)
        
        return point
    }
    
    func isSafe() -> Bool
    {
        return positionY > safePositionY
    }
}
