import UIKit

class MOptionReformaCrossingPlayerPosition
{
    private var positionY:CGFloat
    private var safePositionY:CGFloat
    private let positionX:CGFloat
    private let kAddPositionY:CGFloat = 205
    
    init()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        positionX = sceneWidth / 2.0
        positionY = 0
        safePositionY = 0
    }
    
    //MARK: private
    
    private func makePoint() -> CGPoint
    {
        let point:CGPoint = CGPoint(x:positionX, y:positionY)
        
        return point
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
    
    func walk(distance:CGFloat) -> CGPoint
    {
        positionY += distance
        let newPoint:CGPoint = makePoint()
        
        return newPoint
    }
    
    func isSafe() -> Bool
    {
        return positionY > safePositionY
    }
}
