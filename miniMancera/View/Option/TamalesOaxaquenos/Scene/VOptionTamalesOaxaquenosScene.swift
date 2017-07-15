import Foundation

class VOptionTamalesOaxaquenosScene:ViewGameScene<MOptionTamalesOaxaquenos>
{
    required init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        super.init(controller:controller)
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let background:VOptionTamalesOaxaquenosBackground = VOptionTamalesOaxaquenosBackground(
            controller:controller)
        
        addChild(background)
        
        factoryArea()
    }
    
    private func factoryArea()
    {
        factoryFloor()
    }
    
    private func factoryFloor()
    {
        let items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol] = controller.model.area.floorItems
        
        for item:MOptionTamalesOaxaquenosAreaFloorItemProtocol in items
        {
            guard
                
                let node:ViewGameNode<MOptionTamalesOaxaquenos> = item.factoryNode(
                    controller:controller)
                
                else
            {
                continue
            }
            
            addChild(node)
        }
    }
}
