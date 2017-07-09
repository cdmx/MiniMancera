import UIKit

class ViewGameNodeGameOverExit<T:MGame>:ViewGameNode<T>
{
    private let orientation:UIInterfaceOrientation
    private let kPositionY:CGFloat = 50
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        orientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait)
    {
        self.orientation = orientation
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        position = CGPoint(x:sceneWidth_2, y:kPositionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        isUserInteractionEnabled = false
        controller.gamePlayNoMore()
    }
    
    //MARK: private
    
    private func orientationSceneWidth() -> CGFloat
    {
        switch orientation
        {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown,
             UIInterfaceOrientation.unknown:
            
            return MGame.sceneSize.width
            
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            
            return MGame.sceneSize.height
        }
    }
}
