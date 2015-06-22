package flixel.input;
import openfl.errors.Error;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;
class FlxInputMappingManager {

	private static var inputActionMap:Map<FlxInputAction,FlxInputMapping> = new Map<FlxInputAction,FlxInputMapping>() ;

	private static var inputListingObjectActionMap:Map<FlxBasic,Map<FlxInputAction,FlxInputMapping>> = new Map<FlxBasic,Map<FlxInputAction,FlxInputMapping>>() ;

	private static var _default:FlxBasic = new FlxBasic();
	public function new() {
		//inputActionMap = new Map();
    }
    public static function addKeysAction(inputAction:FlxInputAction,KeyList:Array<FlxKey>,listingObjects:Array<FlxBasic>=null):Void
	{

		if(listingObjects == null)  listingObjects = [_default] ;  // if not specific lister add default


		for (listingObject in listingObjects ){


		var _inputActionMap =	(inputListingObjectActionMap.get(listingObject) 	== null ? new Map<FlxInputAction,FlxInputMapping>() : inputListingObjectActionMap.get(listingObject)) ;


				var _inputMapping:FlxInputMapping = (_inputActionMap.get(inputAction)!=null ? _inputActionMap.get(inputAction) : new FlxInputMapping());

				_inputMapping.keys = KeyList ;

				_inputActionMap.set(inputAction,_inputMapping);


				inputListingObjectActionMap.set(listingObject,_inputActionMap);


		}


	}

	public static function addGamePadAction(inputAction:FlxInputAction,gamepadButtonList:Array<FlxGamepadInputID>):Void
	{
		var _inputMapping:FlxInputMapping = (inputActionMap.get(inputAction)!=null ? inputActionMap.get(inputAction) : new FlxInputMapping());

		_inputMapping.gamepadButtons = gamepadButtonList ;

		inputActionMap.set(inputAction,_inputMapping);
	}

	public static function clear():Void
	{
		inputActionMap = new Map<FlxInputAction,FlxInputMapping>();
	}

    public static function getInputAction(inputAction:String,listingObject:FlxBasic=null):FlxInputMapping
	{

        if(listingObject == null )
			listingObject = _default ;
		var _inputActionMap = null;
		if(listingObject != null ) _inputActionMap =	inputListingObjectActionMap.get(listingObject) ;
        var input:FlxInputMapping = (_inputActionMap == null || _inputActionMap .get(inputAction) == null ) ? new FlxInputMapping():   _inputActionMap .get(inputAction) ;
		//if(input == null)
		//	throw new Error(" Input action "+inputAction+" is not added to the InputMapping  : use  FlxInputMappingManager.add");


		return input ;
	}
}
