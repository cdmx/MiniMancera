import SpriteKit

class MOptionReformaCrossingStop
{
    weak var view:VOptionReformaCrossingStop?
    private let kBlockDuration:TimeInterval = 0.2
    private let kZPosition:CGFloat = 999999
    private let kAnimationFrameTime:TimeInterval = 0.03
}

/*
 
 
 
 
 override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
 {
 if controller.model.gameActive
 {
 if unblockTime == nil
 {
 animateStop()
 }
 
 measureUnblockTime()
 controller.playerStop()
 }
 }
 
 //MARK: private
 /*
 private func startPosition() -> CGPoint
 {
 let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
 let sizeHeight_2:CGFloat = size.height / 2.0
 let point:CGPoint = CGPoint(x:sceneWidth_2, y:sizeHeight_2)
 
 return point
 }*/
 
 private func animateStop()
 {
 let actionAnimation:SKAction = SKAction.animate(
 with:animationTextures,
 timePerFrame:kAnimationFrameTime,
 resize:false,
 restore:false)
 
 run(actionAnimation)
 }
 
 private func reEnable()
 {
 unblockTime = nil
 texture = standTexture
 }
 
 private func measureUnblockTime()
 {
 unblockTime = lastElapsedTime + kBlockDuration
 }
 
 //MARK: public
 
 func update(elapsedTime:TimeInterval)
 {
 lastElapsedTime = elapsedTime
 
 if let unblockTime:TimeInterval = self.unblockTime
 {
 if unblockTime < elapsedTime
 {
 reEnable()
 }
 }
 }
 
 
 */
